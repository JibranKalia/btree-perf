const std = @import("std");
const BTreeNode = @import("BTreeNode").BTreeNode;

pub fn main() void {
    const maxKey = 20;

    var tree: BTreeNode = BTreeNode.new(maxKey);

    for (0..maxKey) |value| {
        tree.insert(value);
    }

    tree.visualize();
}
