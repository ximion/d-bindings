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


module appstream.Icon;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Icon : ObjectG
{
	/** the main GObject struct */
	protected AsIcon* asIcon;

	/** Get the main GObject struct */
	public AsIcon* getIconStruct()
	{
		return asIcon;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asIcon;
	}

	protected override void setStruct(GObject* obj)
	{
		asIcon = cast(AsIcon*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsIcon* asIcon, bool ownedRef = false)
	{
		this.asIcon = asIcon;
		super(cast(GObject*)asIcon, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_icon_get_type();
	}

	/**
	 * Creates a new #AsIcon.
	 *
	 * Return: a #AsIcon
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_icon_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsIcon*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     kindStr = the string.
	 *
	 * Return: a #AsIconKind or %AS_ICON_KIND_UNKNOWN for unknown
	 */
	public static AsIconKind kindFromString(string kindStr)
	{
		return as_icon_kind_from_string(Str.toStringz(kindStr));
	}

	/**
	 * Converts the enumerated value to an text representation.
	 *
	 * Params:
	 *     kind = the %AsIconKind.
	 *
	 * Return: string version of @kind
	 */
	public static string kindToString(AsIconKind kind)
	{
		return Str.toString(as_icon_kind_to_string(kind));
	}

	/**
	 * Return: The absolute path for the icon on disk.
	 *     This is only set for icons of kind %AS_ICON_KIND_LOCAL or
	 *     %AS_ICON_KIND_CACHED.
	 */
	public string getFilename()
	{
		return Str.toString(as_icon_get_filename(asIcon));
	}

	/**
	 * Return: The icon height in pixels, or 0 if unknown.
	 */
	public uint getHeight()
	{
		return as_icon_get_height(asIcon);
	}

	/**
	 * Gets the icon kind.
	 *
	 * Return: the #AsIconKind
	 */
	public AsIconKind getKind()
	{
		return as_icon_get_kind(asIcon);
	}

	/**
	 * Return: the stock name of the icon. In case the icon is not of kind
	 *     "stock", the basename of the icon filename or URL is returned.
	 */
	public string getName()
	{
		return Str.toString(as_icon_get_name(asIcon));
	}

	/**
	 * Gets the icon URL, pointing at a remote location. HTTPS and FTP urls are allowed.
	 * This property is only set for icons of type %AS_ICON_KIND_REMOTE
	 *
	 * Return: the URL
	 */
	public string getUrl()
	{
		return Str.toString(as_icon_get_url(asIcon));
	}

	/**
	 * Return: The icon width in pixels, or 0 if unknown.
	 */
	public uint getWidth()
	{
		return as_icon_get_width(asIcon);
	}

	/**
	 * Sets the icon absolute filename.
	 *
	 * Params:
	 *     filename = the new icon URL.
	 */
	public void setFilename(string filename)
	{
		as_icon_set_filename(asIcon, Str.toStringz(filename));
	}

	/**
	 * Sets the icon height.
	 *
	 * Params:
	 *     height = the height in pixels.
	 */
	public void setHeight(uint height)
	{
		as_icon_set_height(asIcon, height);
	}

	/**
	 * Sets the icon kind.
	 *
	 * Params:
	 *     kind = the #AsIconKind, e.g. %AS_ICON_KIND_CACHED.
	 */
	public void setKind(AsIconKind kind)
	{
		as_icon_set_kind(asIcon, kind);
	}

	/**
	 * Sets the stock name or basename to use for the icon.
	 *
	 * Params:
	 *     name = the icon stock name, e.g. "gwenview"
	 */
	public void setName(string name)
	{
		as_icon_set_name(asIcon, Str.toStringz(name));
	}

	/**
	 * Sets the icon URL.
	 *
	 * Params:
	 *     url = the new icon URL.
	 */
	public void setUrl(string url)
	{
		as_icon_set_url(asIcon, Str.toStringz(url));
	}

	/**
	 * Sets the icon width.
	 *
	 * Params:
	 *     width = the width in pixels.
	 */
	public void setWidth(uint width)
	{
		as_icon_set_width(asIcon, width);
	}
}
