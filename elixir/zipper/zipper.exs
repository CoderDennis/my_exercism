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
  Can this be implemented with only a trail that acts like a stack?

  The head of the trail is the focused node.
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
  def left(z), do: nil

  @doc """
  Get the right child of the focus node, if any.
  """
  @spec right(Z.t) :: Z.t | nil
  def right(z), do: nil

  @doc """
  Get the parent of the focus node, if any.
  """
  @spec up(Z.t) :: Z.t | nil
  def up(z), do: nil

  @doc """
  Set the value of the focus node.
  """
  @spec set_value(Z.t, any) :: Z.t
  def set_value(z, v), do: nil

  @doc """
  Replace the left child tree of the focus node.
  """
  @spec set_left(Z.t, BT.t) :: Z.t
  def set_left(z, l), do: nil

  @doc """
  Replace the right child tree of the focus node.
  """
  @spec set_right(Z.t, BT.t) :: Z.t
  def set_right(z, r), do: nil
end
