const std = @import("std");

pub const BTreeNode = struct {
    keys: []u64,
    children: []BTreeNode,
    isLeaf: bool,
    maxKeys: u8,

    pub fn init(maxKeys: u8) BTreeNode {
        return BTreeNode{ .keys = std.heap.page_allocator.alloc(u64, maxKeys), .children = std.heap.page_allocator.alloc(BTreeNode, maxKeys + 1), .isLeaf = true, .maxKeys = maxKeys, .keyCount = 0 };
    }
};
