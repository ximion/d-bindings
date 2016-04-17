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


module gio.BytesIcon;

private import gi.gio;
public  import gi.giotypes;
private import gio.IconIF;
private import gio.IconT;
private import gio.LoadableIconIF;
private import gio.LoadableIconT;
private import glib.Bytes;
private import glib.ConstructionException;
private import gobject.ObjectG;


/**
 * #GBytesIcon specifies an image held in memory in a common format (usually
 * png) to be used as icon.
 */
public class BytesIcon : ObjectG, IconIF, LoadableIconIF
{
	/** the main GObject struct */
	protected GBytesIcon* gBytesIcon;

	/** Get the main GObject struct */
	public GBytesIcon* getBytesIconStruct()
	{
		return gBytesIcon;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gBytesIcon;
	}

	protected override void setStruct(GObject* obj)
	{
		gBytesIcon = cast(GBytesIcon*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GBytesIcon* gBytesIcon, bool ownedRef = false)
	{
		this.gBytesIcon = gBytesIcon;
		super(cast(GObject*)gBytesIcon, ownedRef);
	}

	// add the Icon capabilities
	mixin IconT!(GBytesIcon);

	// add the LoadableIcon capabilities
	mixin LoadableIconT!(GBytesIcon);


	/** */
	public static GType getType()
	{
		return g_bytes_icon_get_type();
	}

	/**
	 * Creates a new icon for a bytes.
	 *
	 * Params:
	 *     bytes = a #GBytes.
	 *
	 * Return: a #GIcon for the given
	 *     @bytes, or %NULL on error.
	 *
	 * Since: 2.38
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(Bytes bytes)
	{
		auto p = g_bytes_icon_new((bytes is null) ? null : bytes.getBytesStruct());
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GBytesIcon*) p, true);
	}

	/**
	 * Gets the #GBytes associated with the given @icon.
	 *
	 * Return: a #GBytes, or %NULL.
	 *
	 * Since: 2.38
	 */
	public Bytes getBytes()
	{
		auto p = g_bytes_icon_get_bytes(gBytesIcon);
		
		if(p is null)
		{
			return null;
		}
		
		return new Bytes(cast(GBytes*) p);
	}
}
