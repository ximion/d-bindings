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


module gio.SimplePermission;

private import gi.gio;
public  import gi.giotypes;
private import gio.Permission;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GSimplePermission is a trivial implementation of #GPermission that
 * represents a permission that is either always or never allowed.  The
 * value is given at construction and doesn't change.
 * 
 * Calling request or release will result in errors.
 */
public class SimplePermission : Permission
{
	/** the main GObject struct */
	protected GSimplePermission* gSimplePermission;

	/** Get the main GObject struct */
	public GSimplePermission* getSimplePermissionStruct()
	{
		return gSimplePermission;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gSimplePermission;
	}

	protected override void setStruct(GObject* obj)
	{
		gSimplePermission = cast(GSimplePermission*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GSimplePermission* gSimplePermission, bool ownedRef = false)
	{
		this.gSimplePermission = gSimplePermission;
		super(cast(GPermission*)gSimplePermission, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_simple_permission_get_type();
	}

	/**
	 * Creates a new #GPermission instance that represents an action that is
	 * either always or never allowed.
	 *
	 * Params:
	 *     allowed = %TRUE if the action is allowed
	 *
	 * Return: the #GSimplePermission, as a #GPermission
	 *
	 * Since: 2.26
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(bool allowed)
	{
		auto p = g_simple_permission_new(allowed);
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GSimplePermission*) p, true);
	}
}
