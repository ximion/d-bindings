/*
 * This file is part of gtkD.
 *
 * gtkD is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License
 * as published by the Free Software Foundation; either version 3
 * of the License, or (at your option) any later version, with
 * some exceptions, please read the COPYING file.
 *
 * gtkD is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with gtkD; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110, USA
 */

// generated automatically - do not change
// find conversion definition on APILookup.txt
// implement new conversion functionalities on the wrap.utils pakage


module glib.Node;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ConstructionException;


/**
 * The #GNode struct represents one node in a [n-ary tree][glib-N-ary-Trees].
 */
public class Node
{
	/** the main GObject struct */
	protected GNode* gNode;

	/** Get the main GObject struct */
	public GNode* getNodeStruct()
	{
		return gNode;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gNode;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GNode* gNode)
	{
		this.gNode = gNode;
	}


	/**
	 * Gets the position of the first child of a #GNode
	 * which contains the given data.
	 *
	 * Params:
	 *     data = the data to find
	 *
	 * Return: the index of the child of @node which contains
	 *     @data, or -1 if the data is not found
	 */
	public int childIndex(void* data)
	{
		return g_node_child_index(gNode, data);
	}

	/**
	 * Gets the position of a #GNode with respect to its siblings.
	 * @child must be a child of @node. The first child is numbered 0,
	 * the second 1, and so on.
	 *
	 * Params:
	 *     child = a child of @node
	 *
	 * Return: the position of @child with respect to its siblings
	 */
	public int childPosition(Node child)
	{
		return g_node_child_position(gNode, (child is null) ? null : child.getNodeStruct());
	}

	/**
	 * Calls a function for each of the children of a #GNode.
	 * Note that it doesn't descend beneath the child nodes.
	 *
	 * Params:
	 *     flags = which types of children are to be visited, one of
	 *         %G_TRAVERSE_ALL, %G_TRAVERSE_LEAVES and %G_TRAVERSE_NON_LEAVES
	 *     func = the function to call for each visited node
	 *     data = user data to pass to the function
	 */
	public void childrenForeach(GTraverseFlags flags, GNodeForeachFunc func, void* data)
	{
		g_node_children_foreach(gNode, flags, func, data);
	}

	/**
	 * Recursively copies a #GNode (but does not deep-copy the data inside the
	 * nodes, see g_node_copy_deep() if you need that).
	 *
	 * Return: a new #GNode containing the same data pointers
	 */
	public Node copy()
	{
		auto p = g_node_copy(gNode);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Recursively copies a #GNode and its data.
	 *
	 * Params:
	 *     copyFunc = the function which is called to copy the data inside each node,
	 *         or %NULL to use the original data.
	 *     data = data to pass to @copy_func
	 *
	 * Return: a new #GNode containing copies of the data in @node.
	 *
	 * Since: 2.4
	 */
	public Node copyDeep(GCopyFunc copyFunc, void* data)
	{
		auto p = g_node_copy_deep(gNode, copyFunc, data);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Gets the depth of a #GNode.
	 *
	 * If @node is %NULL the depth is 0. The root node has a depth of 1.
	 * For the children of the root node the depth is 2. And so on.
	 *
	 * Return: the depth of the #GNode
	 */
	public uint depth()
	{
		return g_node_depth(gNode);
	}

	/**
	 * Removes @root and its children from the tree, freeing any memory
	 * allocated.
	 */
	public void destroy()
	{
		g_node_destroy(gNode);
	}

	/**
	 * Finds a #GNode in a tree.
	 *
	 * Params:
	 *     order = the order in which nodes are visited - %G_IN_ORDER,
	 *         %G_PRE_ORDER, %G_POST_ORDER, or %G_LEVEL_ORDER
	 *     flags = which types of children are to be searched, one of
	 *         %G_TRAVERSE_ALL, %G_TRAVERSE_LEAVES and %G_TRAVERSE_NON_LEAVES
	 *     data = the data to find
	 *
	 * Return: the found #GNode, or %NULL if the data is not found
	 */
	public Node find(GTraverseType order, GTraverseFlags flags, void* data)
	{
		auto p = g_node_find(gNode, order, flags, data);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Finds the first child of a #GNode with the given data.
	 *
	 * Params:
	 *     flags = which types of children are to be searched, one of
	 *         %G_TRAVERSE_ALL, %G_TRAVERSE_LEAVES and %G_TRAVERSE_NON_LEAVES
	 *     data = the data to find
	 *
	 * Return: the found child #GNode, or %NULL if the data is not found
	 */
	public Node findChild(GTraverseFlags flags, void* data)
	{
		auto p = g_node_find_child(gNode, flags, data);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Gets the first sibling of a #GNode.
	 * This could possibly be the node itself.
	 *
	 * Return: the first sibling of @node
	 */
	public Node firstSibling()
	{
		auto p = g_node_first_sibling(gNode);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Gets the root of a tree.
	 *
	 * Return: the root of the tree
	 */
	public Node getRoot()
	{
		auto p = g_node_get_root(gNode);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Inserts a #GNode beneath the parent at the given position.
	 *
	 * Params:
	 *     position = the position to place @node at, with respect to its siblings
	 *         If position is -1, @node is inserted as the last child of @parent
	 *     node = the #GNode to insert
	 *
	 * Return: the inserted #GNode
	 */
	public Node insert(int position, Node node)
	{
		auto p = g_node_insert(gNode, position, (node is null) ? null : node.getNodeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Inserts a #GNode beneath the parent after the given sibling.
	 *
	 * Params:
	 *     sibling = the sibling #GNode to place @node after.
	 *         If sibling is %NULL, the node is inserted as the first child of @parent.
	 *     node = the #GNode to insert
	 *
	 * Return: the inserted #GNode
	 */
	public Node insertAfter(Node sibling, Node node)
	{
		auto p = g_node_insert_after(gNode, (sibling is null) ? null : sibling.getNodeStruct(), (node is null) ? null : node.getNodeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Inserts a #GNode beneath the parent before the given sibling.
	 *
	 * Params:
	 *     sibling = the sibling #GNode to place @node before.
	 *         If sibling is %NULL, the node is inserted as the last child of @parent.
	 *     node = the #GNode to insert
	 *
	 * Return: the inserted #GNode
	 */
	public Node insertBefore(Node sibling, Node node)
	{
		auto p = g_node_insert_before(gNode, (sibling is null) ? null : sibling.getNodeStruct(), (node is null) ? null : node.getNodeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Returns %TRUE if @node is an ancestor of @descendant.
	 * This is true if node is the parent of @descendant,
	 * or if node is the grandparent of @descendant etc.
	 *
	 * Params:
	 *     descendant = a #GNode
	 *
	 * Return: %TRUE if @node is an ancestor of @descendant
	 */
	public bool isAncestor(Node descendant)
	{
		return g_node_is_ancestor(gNode, (descendant is null) ? null : descendant.getNodeStruct()) != 0;
	}

	/**
	 * Gets the last child of a #GNode.
	 *
	 * Return: the last child of @node, or %NULL if @node has no children
	 */
	public Node lastChild()
	{
		auto p = g_node_last_child(gNode);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Gets the last sibling of a #GNode.
	 * This could possibly be the node itself.
	 *
	 * Return: the last sibling of @node
	 */
	public Node lastSibling()
	{
		auto p = g_node_last_sibling(gNode);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Gets the maximum height of all branches beneath a #GNode.
	 * This is the maximum distance from the #GNode to all leaf nodes.
	 *
	 * If @root is %NULL, 0 is returned. If @root has no children,
	 * 1 is returned. If @root has children, 2 is returned. And so on.
	 *
	 * Return: the maximum height of the tree beneath @root
	 */
	public uint maxHeight()
	{
		return g_node_max_height(gNode);
	}

	/**
	 * Gets the number of children of a #GNode.
	 *
	 * Return: the number of children of @node
	 */
	public uint nChildren()
	{
		return g_node_n_children(gNode);
	}

	/**
	 * Gets the number of nodes in a tree.
	 *
	 * Params:
	 *     flags = which types of children are to be counted, one of
	 *         %G_TRAVERSE_ALL, %G_TRAVERSE_LEAVES and %G_TRAVERSE_NON_LEAVES
	 *
	 * Return: the number of nodes in the tree
	 */
	public uint nNodes(GTraverseFlags flags)
	{
		return g_node_n_nodes(gNode, flags);
	}

	/**
	 * Gets a child of a #GNode, using the given index.
	 * The first child is at index 0. If the index is
	 * too big, %NULL is returned.
	 *
	 * Params:
	 *     n = the index of the desired child
	 *
	 * Return: the child of @node at index @n
	 */
	public Node nthChild(uint n)
	{
		auto p = g_node_nth_child(gNode, n);
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Inserts a #GNode as the first child of the given parent.
	 *
	 * Params:
	 *     node = the #GNode to insert
	 *
	 * Return: the inserted #GNode
	 */
	public Node prepend(Node node)
	{
		auto p = g_node_prepend(gNode, (node is null) ? null : node.getNodeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return new Node(cast(GNode*) p);
	}

	/**
	 * Reverses the order of the children of a #GNode.
	 * (It doesn't change the order of the grandchildren.)
	 */
	public void reverseChildren()
	{
		g_node_reverse_children(gNode);
	}

	/**
	 * Traverses a tree starting at the given root #GNode.
	 * It calls the given function for each node visited.
	 * The traversal can be halted at any point by returning %TRUE from @func.
	 *
	 * Params:
	 *     order = the order in which nodes are visited - %G_IN_ORDER,
	 *         %G_PRE_ORDER, %G_POST_ORDER, or %G_LEVEL_ORDER.
	 *     flags = which types of children are to be visited, one of
	 *         %G_TRAVERSE_ALL, %G_TRAVERSE_LEAVES and %G_TRAVERSE_NON_LEAVES
	 *     maxDepth = the maximum depth of the traversal. Nodes below this
	 *         depth will not be visited. If max_depth is -1 all nodes in
	 *         the tree are visited. If depth is 1, only the root is visited.
	 *         If depth is 2, the root and its children are visited. And so on.
	 *     func = the function to call for each visited #GNode
	 *     data = user data to pass to the function
	 */
	public void traverse(GTraverseType order, GTraverseFlags flags, int maxDepth, GNodeTraverseFunc func, void* data)
	{
		g_node_traverse(gNode, order, flags, maxDepth, func, data);
	}

	/**
	 * Unlinks a #GNode from a tree, resulting in two separate trees.
	 */
	public void unlink()
	{
		g_node_unlink(gNode);
	}

	/**
	 * Creates a new #GNode containing the given data.
	 * Used to create the first node in a tree.
	 *
	 * Params:
	 *     data = the data of the new node
	 *
	 * Return: a new #GNode
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(void* data)
	{
		auto p = g_node_new(data);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GNode*) p);
	}
}
