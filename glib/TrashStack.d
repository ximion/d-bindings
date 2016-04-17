/*
 * Licensed under the GNU Lesser General Public License Version 3
 *
 * This library is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the license, or
 * (at your option) any later version.
 *
 * This software is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library.  If not, see <http://www.gnu.org/licenses/>.
 */

// generated automatically - do not change


module glib.TrashStack;

private import gi.glib;
public  import gi.glibtypes;


/**
 * Each piece of memory that is pushed onto the stack
 * is cast to a GTrashStack*.
 */
public struct TrashStack
{

	/**
	 * Returns the height of a #GTrashStack.
	 *
	 * Note that execution of this function is of O(N) complexity
	 * where N denotes the number of items on the stack.
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *
	 * Return: the height of the stack
	 */
	public static uint height(GTrashStack** stackP)
	{
		return g_trash_stack_height(stackP);
	}

	/**
	 * Returns the element at the top of a #GTrashStack
	 * which may be %NULL.
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *
	 * Return: the element at the top of the stack
	 */
	public static void* peek(GTrashStack** stackP)
	{
		return g_trash_stack_peek(stackP);
	}

	/**
	 * Pops a piece of memory off a #GTrashStack.
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *
	 * Return: the element at the top of the stack
	 */
	public static void* pop(GTrashStack** stackP)
	{
		return g_trash_stack_pop(stackP);
	}

	/**
	 * Pushes a piece of memory onto a #GTrashStack.
	 *
	 * Params:
	 *     stackP = a #GTrashStack
	 *     dataP = the piece of memory to push on the stack
	 */
	public static void push(GTrashStack** stackP, void* dataP)
	{
		g_trash_stack_push(stackP, dataP);
	}
}
