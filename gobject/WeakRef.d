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


module gobject.WeakRef;

private import gi.gobject;
public  import gi.gobjecttypes;
private import gobject.ObjectG;


/**
 * A structure containing a weak reference to a #GObject.  It can either
 * be empty (i.e. point to %NULL), or point to an object for as long as
 * at least one "strong" reference to that object exists. Before the
 * object's #GObjectClass.dispose method is called, every #GWeakRef
 * associated with becomes empty (i.e. points to %NULL).
 * 
 * Like #GValue, #GWeakRef can be statically allocated, stack- or
 * heap-allocated, or embedded in larger structures.
 * 
 * Unlike g_object_weak_ref() and g_object_add_weak_pointer(), this weak
 * reference is thread-safe: converting a weak pointer to a reference is
 * atomic with respect to invalidation of weak pointers to destroyed
 * objects.
 * 
 * If the object's #GObjectClass.dispose method results in additional
 * references to the object being held, any #GWeakRefs taken
 * before it was disposed will continue to point to %NULL.  If
 * #GWeakRefs are taken after the object is disposed and
 * re-referenced, they will continue to point to it until its refcount
 * goes back to zero, at which point they too will be invalidated.
 */
public class WeakRef
{
	/** the main GObject struct */
	protected GWeakRef* gWeakRef;

	/** Get the main GObject struct */
	public GWeakRef* getWeakRefStruct()
	{
		return gWeakRef;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gWeakRef;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GWeakRef* gWeakRef)
	{
		this.gWeakRef = gWeakRef;
	}

	/** */
	this(void* object)
	{
		g_weak_ref_init(gWeakRef, object);
	}

	/**
	 */

	/**
	 * Frees resources associated with a non-statically-allocated #GWeakRef.
	 * After this call, the #GWeakRef is left in an undefined state.
	 *
	 * You should only call this on a #GWeakRef that previously had
	 * g_weak_ref_init() called on it.
	 *
	 * Since: 2.32
	 */
	public void clear()
	{
		g_weak_ref_clear(gWeakRef);
	}

	/**
	 * If @weak_ref is not empty, atomically acquire a strong
	 * reference to the object it points to, and return that reference.
	 *
	 * This function is needed because of the potential race between taking
	 * the pointer value and g_object_ref() on it, if the object was losing
	 * its last reference at the same time in a different thread.
	 *
	 * The caller should release the resulting reference in the usual way,
	 * by using g_object_unref().
	 *
	 * Return: the object pointed to
	 *     by @weak_ref, or %NULL if it was empty
	 *
	 * Since: 2.32
	 */
	public ObjectG get()
	{
		auto p = g_weak_ref_get(gWeakRef);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(ObjectG)(cast(GObject*) p, true);
	}

	/**
	 * Initialise a non-statically-allocated #GWeakRef.
	 *
	 * This function also calls g_weak_ref_set() with @object on the
	 * freshly-initialised weak reference.
	 *
	 * This function should always be matched with a call to
	 * g_weak_ref_clear().  It is not necessary to use this function for a
	 * #GWeakRef in static storage because it will already be
	 * properly initialised.  Just use g_weak_ref_set() directly.
	 *
	 * Params:
	 *     object = a #GObject or %NULL
	 *
	 * Since: 2.32
	 */
	public void init(void* object)
	{
		g_weak_ref_init(gWeakRef, object);
	}

	/**
	 * Change the object to which @weak_ref points, or set it to
	 * %NULL.
	 *
	 * You must own a strong reference on @object while calling this
	 * function.
	 *
	 * Params:
	 *     object = a #GObject or %NULL
	 *
	 * Since: 2.32
	 */
	public void set(void* object)
	{
		g_weak_ref_set(gWeakRef, object);
	}
}
