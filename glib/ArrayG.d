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


module glib.ArrayG;

private import gi.glib;
public  import gi.glibtypes;
private import glib.ConstructionException;
private import glib.Str;


/**
 * Contains the public fields of a GArray.
 */
public class ArrayG
{
	/** the main GObject struct */
	protected GArray* gArray;

	/** Get the main GObject struct */
	public GArray* getArrayGStruct()
	{
		return gArray;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gArray;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GArray* gArray)
	{
		this.gArray = gArray;
	}


	/**
	 * Adds @len elements onto the end of the array.
	 *
	 * Params:
	 *     data = a pointer to the elements to append to the end of the array
	 *     len = the number of elements to append
	 *
	 * Return: the #GArray
	 */
	public ArrayG appendVals(void* data, uint len)
	{
		auto p = g_array_append_vals(gArray, data, len);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Frees the memory allocated for the #GArray. If @free_segment is
	 * %TRUE it frees the memory block holding the elements as well and
	 * also each element if @array has a @element_free_func set. Pass
	 * %FALSE if you want to free the #GArray wrapper but preserve the
	 * underlying array for use elsewhere. If the reference count of @array
	 * is greater than one, the #GArray wrapper is preserved but the size
	 * of @array will be set to zero.
	 *
	 * If array elements contain dynamically-allocated memory, they should
	 * be freed separately.
	 *
	 * Params:
	 *     freeSegment = if %TRUE the actual element data is freed as well
	 *
	 * Return: the element data if @free_segment is %FALSE, otherwise
	 *     %NULL. The element data should be freed using g_free().
	 */
	public string free(bool freeSegment)
	{
		return Str.toString(g_array_free(gArray, freeSegment));
	}

	/**
	 * Gets the size of the elements in @array.
	 *
	 * Return: Size of each element, in bytes
	 *
	 * Since: 2.22
	 */
	public uint getElementSize()
	{
		return g_array_get_element_size(gArray);
	}

	/**
	 * Inserts @len elements into a #GArray at the given index.
	 *
	 * Params:
	 *     index = the index to place the elements at
	 *     data = a pointer to the elements to insert
	 *     len = the number of elements to insert
	 *
	 * Return: the #GArray
	 */
	public ArrayG insertVals(uint index, void* data, uint len)
	{
		auto p = g_array_insert_vals(gArray, index, data, len);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Creates a new #GArray with a reference count of 1.
	 *
	 * Params:
	 *     zeroTerminated = %TRUE if the array should have an extra element at
	 *         the end which is set to 0
	 *     clear = %TRUE if #GArray elements should be automatically cleared
	 *         to 0 when they are allocated
	 *     elementSize = the size of each element in bytes
	 *
	 * Return: the new #GArray
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(bool zeroTerminated, bool clear, uint elementSize)
	{
		auto p = g_array_new(zeroTerminated, clear, elementSize);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GArray*) p);
	}

	/**
	 * Adds @len elements onto the start of the array.
	 *
	 * This operation is slower than g_array_append_vals() since the
	 * existing elements in the array have to be moved to make space for
	 * the new elements.
	 *
	 * Params:
	 *     data = a pointer to the elements to prepend to the start of the array
	 *     len = the number of elements to prepend
	 *
	 * Return: the #GArray
	 */
	public ArrayG prependVals(void* data, uint len)
	{
		auto p = g_array_prepend_vals(gArray, data, len);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Atomically increments the reference count of @array by one.
	 * This function is MT-safe and may be called from any thread.
	 *
	 * Return: The passed in #GArray
	 *
	 * Since: 2.22
	 */
	public ArrayG doref()
	{
		auto p = g_array_ref(gArray);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Removes the element at the given index from a #GArray. The following
	 * elements are moved down one place.
	 *
	 * Params:
	 *     index = the index of the element to remove
	 *
	 * Return: the #GArray
	 */
	public ArrayG removeIndex(uint index)
	{
		auto p = g_array_remove_index(gArray, index);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Removes the element at the given index from a #GArray. The last
	 * element in the array is used to fill in the space, so this function
	 * does not preserve the order of the #GArray. But it is faster than
	 * g_array_remove_index().
	 *
	 * Params:
	 *     index = the index of the element to remove
	 *
	 * Return: the #GArray
	 */
	public ArrayG removeIndexFast(uint index)
	{
		auto p = g_array_remove_index_fast(gArray, index);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Removes the given number of elements starting at the given index
	 * from a #GArray.  The following elements are moved to close the gap.
	 *
	 * Params:
	 *     index = the index of the first element to remove
	 *     length = the number of elements to remove
	 *
	 * Return: the #GArray
	 *
	 * Since: 2.4
	 */
	public ArrayG removeRange(uint index, uint length)
	{
		auto p = g_array_remove_range(gArray, index, length);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Sets a function to clear an element of @array.
	 *
	 * The @clear_func will be called when an element in the array
	 * data segment is removed and when the array is freed and data
	 * segment is deallocated as well.
	 *
	 * Note that in contrast with other uses of #GDestroyNotify
	 * functions, @clear_func is expected to clear the contents of
	 * the array element it is given, but not free the element itself.
	 *
	 * Params:
	 *     clearFunc = a function to clear an element of @array
	 *
	 * Since: 2.32
	 */
	public void setClearFunc(GDestroyNotify clearFunc)
	{
		g_array_set_clear_func(gArray, clearFunc);
	}

	/**
	 * Sets the size of the array, expanding it if necessary. If the array
	 * was created with @clear_ set to %TRUE, the new elements are set to 0.
	 *
	 * Params:
	 *     length = the new size of the #GArray
	 *
	 * Return: the #GArray
	 */
	public ArrayG setSize(uint length)
	{
		auto p = g_array_set_size(gArray, length);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Creates a new #GArray with @reserved_size elements preallocated and
	 * a reference count of 1. This avoids frequent reallocation, if you
	 * are going to add many elements to the array. Note however that the
	 * size of the array is still 0.
	 *
	 * Params:
	 *     zeroTerminated = %TRUE if the array should have an extra element at
	 *         the end with all bits cleared
	 *     clear = %TRUE if all bits in the array should be cleared to 0 on
	 *         allocation
	 *     elementSize = size of each element in the array
	 *     reservedSize = number of elements preallocated
	 *
	 * Return: the new #GArray
	 */
	public static ArrayG sizedNew(bool zeroTerminated, bool clear, uint elementSize, uint reservedSize)
	{
		auto p = g_array_sized_new(zeroTerminated, clear, elementSize, reservedSize);
		
		if(p is null)
		{
			return null;
		}
		
		return new ArrayG(cast(GArray*) p);
	}

	/**
	 * Sorts a #GArray using @compare_func which should be a qsort()-style
	 * comparison function (returns less than zero for first arg is less
	 * than second arg, zero for equal, greater zero if first arg is
	 * greater than second arg).
	 *
	 * This is guaranteed to be a stable sort since version 2.32.
	 *
	 * Params:
	 *     compareFunc = comparison function
	 */
	public void sort(GCompareFunc compareFunc)
	{
		g_array_sort(gArray, compareFunc);
	}

	/**
	 * Like g_array_sort(), but the comparison function receives an extra
	 * user data argument.
	 *
	 * This is guaranteed to be a stable sort since version 2.32.
	 *
	 * There used to be a comment here about making the sort stable by
	 * using the addresses of the elements in the comparison function.
	 * This did not actually work, so any such code should be removed.
	 *
	 * Params:
	 *     compareFunc = comparison function
	 *     userData = data to pass to @compare_func
	 */
	public void sortWithData(GCompareDataFunc compareFunc, void* userData)
	{
		g_array_sort_with_data(gArray, compareFunc, userData);
	}

	/**
	 * Atomically decrements the reference count of @array by one. If the
	 * reference count drops to 0, all memory allocated by the array is
	 * released. This function is MT-safe and may be called from any
	 * thread.
	 *
	 * Since: 2.22
	 */
	public void unref()
	{
		g_array_unref(gArray);
	}
}
