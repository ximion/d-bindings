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


module gobject.Boxed;

private import gi.gobject;
public  import gi.gobjecttypes;
private import glib.Str;


/** */
public struct Boxed
{

	/**
	 * Provide a copy of a boxed structure @src_boxed which is of type @boxed_type.
	 *
	 * Params:
	 *     boxedType = The type of @src_boxed.
	 *     srcBoxed = The boxed structure to be copied.
	 *
	 * Return: The newly created copy of the boxed structure.
	 */
	public static void* copy(GType boxedType, void* srcBoxed)
	{
		return g_boxed_copy(boxedType, srcBoxed);
	}

	/**
	 * Free the boxed structure @boxed which is of type @boxed_type.
	 *
	 * Params:
	 *     boxedType = The type of @boxed.
	 *     boxed = The boxed structure to be freed.
	 */
	public static void free(GType boxedType, void* boxed)
	{
		g_boxed_free(boxedType, boxed);
	}

	/**
	 * This function creates a new %G_TYPE_BOXED derived type id for a new
	 * boxed type with name @name. Boxed type handling functions have to be
	 * provided to copy and free opaque boxed structures of this type.
	 *
	 * Params:
	 *     name = Name of the new boxed type.
	 *     boxedCopy = Boxed structure copy function.
	 *     boxedFree = Boxed structure free function.
	 *
	 * Return: New %G_TYPE_BOXED derived type id for @name.
	 */
	public static GType typeRegisterStatic(string name, GBoxedCopyFunc boxedCopy, GBoxedFreeFunc boxedFree)
	{
		return g_boxed_type_register_static(Str.toStringz(name), boxedCopy, boxedFree);
	}

	/**
	 * Creates a new %G_TYPE_POINTER derived type id for a new
	 * pointer type with name @name.
	 *
	 * Params:
	 *     name = the name of the new pointer type.
	 *
	 * Return: a new %G_TYPE_POINTER derived type id for @name.
	 */
	public static GType pointerTypeRegisterStatic(string name)
	{
		return g_pointer_type_register_static(Str.toStringz(name));
	}
}
