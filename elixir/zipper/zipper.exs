defmodule BinTree do
  alias __MODULE__, as: BT
  @moduledoc """
  A node in a binary tree.

  `value` is the value of a node.
  `left` is the left subtree (nil if no subtree).
  `right` is the right subtree (nil if no subtree).
  """
  @type t :: %BinTree{ value: any, left: BinTree.t | nil, right: BinTree.t | nil }
  defstruct value: nil, left: nil, right: nil
end

defmodule Zipper do
  alias __MODULE__, as: Z
  alias BinTree, as: BT
  @moduledoc """
  The only property needed is trail, which is a list that acts like a stack.

  The head of the trail is the focused node.

  The last item in the list is the root of the tree.
  """
  @type t :: %Zipper{ trail: [BT.t] }
  defstruct trail: []

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BT.t) :: Z.t
  def from_tree(bt), do: %Z{trail: [bt]}

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Z.t) :: BT.t
  def to_tree(%Z{trail: t}), do: List.last(t)

  @doc """
  Get the value of the focus node.
  """
  @spec value(Z.t) :: any
  def value(%Z{trail: [f|_]}), do: f.value

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Z.t) :: Z.t | nil
  def left(%Z{trail: [%BT{left: nil}|_]}), do: nil
  def left(%Z{trail: [f|_] = trail}), do: %Z{trail: [f.left | trail]}

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right(%Z{trail: [%BT{right: nil}|_]}), do: nil
  def right(%Z{trail: [f|_] = trail}), do: %Z{trail: [f.right | trail]}

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t | nil
  def up(%Z{trail: [_bt]}), do: nil
  def up(%Z{trail: [_|trail_tail]}), do: %Z{trail: trail_tail}

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(%Z{trail: [f | trail_tail]}, v) do
    %Z{trail: update_node(f, %{f | value: v}, trail_tail)}
  end

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(%Z{trail: [f | trail_tail]}, l) do
    %Z{trail: update_node(f, %{f | left: l}, trail_tail)}
  end

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(%Z{trail: [f | trail_tail]}, r) do
    %Z{trail: update_node(f, %{f | right: r}, trail_tail)}
  end

  @doc """
  The parent of a new node must be updated to point to it.
  This must be done recursively up the tree.
  """
  defp update_node(_old, new, []), do: [new]
  defp update_node(old, new, [%BT{left: old} = parent | tail]) do
    [new | update_node(parent, %{parent | left: new}, tail)]
  end
  defp update_node(old, new, [%BT{right: old} = parent | tail]) do
    [new | update_node(parent, %{parent | right: new}, tail)]
  end
end
