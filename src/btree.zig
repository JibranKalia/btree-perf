const std = @import("std");

pub const BTreeNode = struct {
    keys: []u64,
    children: []BTreeNode,
    isLeaf: bool,
    maxKeys: u8,
    keyCount: u8,

    pub fn init(maxKeys: u8) BTreeNode {
        return BTreeNode{ .keys = std.heap.page_allocator.alloc(u64, maxKeys), .children = std.heap.page_allocator.alloc(BTreeNode, maxKeys + 1), .isLeaf = true, .maxKeys = maxKeys, .keyCount = 0 };
    }

    pub fn visualize(self: BTreeNode, level: u8) void {
        for (0..level) |_| {
            std.debug.print(" ", .{});
        }
        std.debug.print("Level {d}: ", .{level});
        for (0..self.keyCount) |i| {
            std.debug.print("{d} ", .{self.keys[i]});
        }
    }

    pub fn insert(self: *BTreeNode, key: u64) void {
        if (self.keyCount < self.maxKeys) {
            self.keys[self.keyCount] = key;
            self.keyCount += 1;
        }
    }
};
