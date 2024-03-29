const std = @import("std");

const page_size = 8 * 1024; // 8 kb
var outbuf: [page_size]u8 = undefined;

pub fn main() anyerror!void {
    defer std.os.exit(0);
    errdefer std.os.exit(1);

    var stdout = std.io.getStdOut();
    var writer = stdout.writer();

    var argv = std.os.argv;

    const chunk = if (argv.len > 1) argv[1] else "y";

    var outStream = std.io.fixedBufferStream(&outbuf);
    var outWriter = outStream.writer();

    while (true) {
        outWriter.print("{s}\n", .{chunk}) catch |err| switch (err) {
            error.NoSpaceLeft => break,
            else => return err,
        };
    }

    while (true) {
        _ = try writer.write(outbuf[0..]);
    }
}
