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


module gobject.TypeInstance;

private import gi.gobject;
public  import gi.gobjecttypes;


/**
 * An opaque structure used as the base of all type instances.
 */
public class TypeInstance
{
	/** the main GObject struct */
	protected GTypeInstance* gTypeInstance;

	/** Get the main GObject struct */
	public GTypeInstance* getTypeInstanceStruct()
	{
		return gTypeInstance;
	}

	/** the main GObject struct as a void* */
	protected void* getStruct()
	{
		return cast(void*)gTypeInstance;
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GTypeInstance* gTypeInstance)
	{
		this.gTypeInstance = gTypeInstance;
	}


	/** */
	public void* getPrivate(GType privateType)
	{
		return g_type_instance_get_private(gTypeInstance, privateType);
	}
}
