def dump_tree(ruby_tree)
  puts "Visiting a node"
  ruby_tree.visit {|node| puts node.node_name}
  puts

  puts "Visiting entire tree"
  ruby_tree.visit_all {|node| puts node.node_name}
end

class Tree
  attr_accessor :children, :node_name
  def initialize(tree)
    
    initialize('root', [])
  end

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end
  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end
  def visit(&block)
    block.call self
  end
end

#puts '1'
# ruby_tree = Tree.new('Ruby', [Tree.new("Reia"), Tree.new("MacRuby")])
# dump_tree(ruby_tree)

class Tree
  attr_accessor :children, :node_name
  def initialize(name='root',tree)
    @node_name = name
    @children = tree.map { |name, kids| Tree.new(name, kids) }
  end

  def visit_all(&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end
  def visit(&block)
    block.call self
  end
end


puts '2'
ruby_tree = Tree.new({1 => {11 => {111 => {}, 112 => {}, 113 => {}}, 12 => {121 => {}}}})
dump_tree(ruby_tree)
