#if os(Linux)
import Glibc
private let sfork = Glibc.fork
#else
import Darwin
@_silgen_name("fork") private func sfork() -> Int32
#endif


public struct SwiftDaemon {

  /// Creates a daemon in a specified working directory and kick off a given
  /// routine.
  ///
  /// - Note: [reference](shorturl.at/zKRXY)
  public static func daemonize(inDir dir: String,
                               routine: () throws -> ()) rethrows {

    // fork off the parent process
    var ret = sfork()
    if ret < 0 {
        fatalError("SwiftDaemon: sfork returned error: \(ret)")
    } else if ret > 0 {
        exit(EXIT_SUCCESS)
    }

    // change file mode mask (umask)
    umask(0)

    // create a unique Session ID (SID)
    ret = setsid()
    if ret < 0 {
      exit(EXIT_FAILURE)
    }

    // change the current working directory to a safe place
    ret = chdir(dir)
    if ret < 0 {
      exit(EXIT_FAILURE)
    }

    // close standard file descriptors, instead we redirect everything to "null"
    let nfd = open("/dev/null", O_RDWR)
    if nfd < 0 {
      exit(EXIT_FAILURE)
    }

    close(0)

    ret = dup2(nfd, 1)
    if ret < 0 {
      exit(EXIT_FAILURE)
    }
      
    dup2(nfd, 2)
    if ret < 0 {
      exit(EXIT_FAILURE)
    }

    close(nfd)

    // start routine
    try routine()
  }
}
