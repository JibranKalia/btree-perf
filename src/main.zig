const std = @import("std");
const BTreeNode = @import("btree.zig").BTreeNode;

pub fn main() !void {
    var arena = std.heap.ArenaAllocator.init(std.heap.page_allocator);
    const allocator = arena.allocator();

    const maxKey = 20;

    var tree: BTreeNode = try BTreeNode.init(allocator, maxKey);

    for (0..400) |value| {
        tree.insert(value);
    }

    tree.visualize(0);
}
