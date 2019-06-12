#if os(Linux)
import Glibc
#else
import Darwin
#endif

import SwiftDaemon


SwiftDaemon.daemonize(inDir: "/tmp") {
  let fd = fopen("SwiftDaemonTest.log", "w")
  defer { fclose(fd) }
  for _ in 1...10 {
    usleep(1000000)
    let content = "Test\n"
    fwrite(content, 1, content.count, fd)
    fflush(fd)
  }
}

