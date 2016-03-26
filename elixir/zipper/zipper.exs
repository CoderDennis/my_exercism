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

  @spec parent(BT.t, BT.t) :: BT.t
  def parent(root, root), do: nil
  def parent(%BT{left: left} = bt, left), do: bt
  def parent(%BT{right: right} = bt, right), do: bt
  def parent(%BT{left: left, right: right}, leaf) do
    parent(left, leaf) || parent(right, leaf)
  end

  @spec replace_node(BT.t, BT.t, BT.t) :: BT.t
  def replace_node(nil, _, _), do: nil
  def replace_node(bt, bt, new), do: new
  def replace_node(%BinTree{left: left, right: right} = bt, old, new) do
    %{bt |
      left: replace_node(left, old, new),
      right: replace_node(right, old, new)}
  end
end

defmodule Zipper do
  alias __MODULE__, as: Z
  alias BinTree, as: BT
  @type t :: %Zipper{ tree: BT.t, focus: BT.t }
  defstruct tree: nil, focus: nil

  @doc """
  Get a zipper focused on the root node.
  """
  @spec from_tree(BT.t) :: Z.t
  def from_tree(bt), do: %Z{tree: bt, focus: bt}

  @doc """
  Get the complete tree from a zipper.
  """
  @spec to_tree(Z.t) :: BT.t
  def to_tree(%Z{tree: bt}), do: bt

  @doc """
  Get the value of the focus node.
  """
  @spec value(Z.t) :: any
  def value(%Z{focus: f}), do: f.value

  @doc """
  Get the left child of the focus node, if any.
  """
  @spec left(Z.t) :: Z.t | nil
  def left(%Z{focus: f} = z), do: focus_result(z, f.left)

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right(%Z{focus: f} = z), do: focus_result(z, f.right)

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t | nil
  def up(%Z{tree: bt, focus: f} = z), do: focus_result(z, BT.parent(bt, f))

  defp focus_result(_, nil), do: nil
  defp focus_result(z, f), do: %{z | focus: f}

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(%Z{focus: f} = z, v), do: replace_focus(z, %{f | value: v})

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(%Z{focus: f} = z, l), do: replace_focus(z, %{f | left: l})

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(%Z{focus: f} = z, r), do: replace_focus(z, %{f | right: r})

  defp replace_focus(%Z{tree: bt, focus: f}, new_f) do
    %Z{tree: BT.replace_node(bt, f, new_f), focus: new_f}
  end
end
