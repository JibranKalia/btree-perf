const std = @import("std");
const Arena = std.heap.ArenaAllocator;
const Allocator = std.mem.Allocator;

pub const BTreeNode = struct {
    keys: []u64,
    children: []BTreeNode,
    isLeaf: bool,
    maxKeys: u8,
    keyCount: u8,

    pub fn init(allocator: Allocator, maxKeys: u8) !BTreeNode {
        const keys = try allocator.alloc(u64, maxKeys);
        const children = try allocator.alloc(BTreeNode, maxKeys + 1);
        return BTreeNode{ .keys = keys, .children = children, .isLeaf = true, .maxKeys = maxKeys, .keyCount = 0 };
    }

    pub fn visualize(self: BTreeNode, level: u8) void {
        const indent = "    ";
        std.debug.print("{s}Level {d}: \n", .{ indent, level });
        for (0..self.keyCount) |i| {
            std.debug.print("{d} ", .{self.keys[i]});
        }
        if (!self.isLeaf) {
            for (0..self.keyCount + 1) |i| {
                if (self.children[i]) {
                    self.children[i].?.visualize(level + 1);
                }
            }
        }
    }

    pub fn insert(self: *BTreeNode, key: u64) void {
        if (self.keyCount < self.maxKeys) {
            self.keys[self.keyCount] = key;
            self.keyCount += 1;
        } else {
            std.debug.print("Node full, splitting required (not implemented)\n", .{});
        }
    }
};
