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


module appstream.Image;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Image : ObjectG
{
	/** the main GObject struct */
	protected AsImage* asImage;

	/** Get the main GObject struct */
	public AsImage* getImageStruct()
	{
		return asImage;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asImage;
	}

	protected override void setStruct(GObject* obj)
	{
		asImage = cast(AsImage*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsImage* asImage, bool ownedRef = false)
	{
		this.asImage = asImage;
		super(cast(GObject*)asImage, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_image_get_type();
	}

	/**
	 * Creates a new #AsImage.
	 *
	 * Return: a #AsImage
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_image_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsImage*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     kind = the string.
	 *
	 * Return: a #AsImageKind, or %AS_IMAGE_KIND_UNKNOWN for unknown.
	 */
	public static AsImageKind kindFromString(string kind)
	{
		return as_image_kind_from_string(Str.toStringz(kind));
	}

	/**
	 * Converts the enumerated value to an text representation.
	 *
	 * Params:
	 *     kind = the #AsImageKind.
	 *
	 * Return: string version of @kind
	 */
	public static string kindToString(AsImageKind kind)
	{
		return Str.toString(as_image_kind_to_string(kind));
	}

	/**
	 * Gets the image height.
	 *
	 * Return: height in pixels
	 */
	public uint getHeight()
	{
		return as_image_get_height(asImage);
	}

	/**
	 * Gets the image kind.
	 *
	 * Return: the #AsImageKind
	 */
	public AsImageKind getKind()
	{
		return as_image_get_kind(asImage);
	}

	/**
	 * Get locale for this image.
	 *
	 * Return: Locale string
	 *
	 * Since: 0.9.5
	 */
	public string getLocale()
	{
		return Str.toString(as_image_get_locale(asImage));
	}

	/**
	 * Gets the full qualified URL for the image, usually pointing at some mirror.
	 *
	 * Return: URL
	 */
	public string getUrl()
	{
		return Str.toString(as_image_get_url(asImage));
	}

	/**
	 * Gets the image width.
	 *
	 * Return: width in pixels
	 */
	public uint getWidth()
	{
		return as_image_get_width(asImage);
	}

	/**
	 * Sets the image height.
	 *
	 * Params:
	 *     height = the height in pixels.
	 */
	public void setHeight(uint height)
	{
		as_image_set_height(asImage, height);
	}

	/**
	 * Sets the image kind.
	 *
	 * Params:
	 *     kind = the #AsImageKind, e.g. %AS_IMAGE_KIND_THUMBNAIL.
	 */
	public void setKind(AsImageKind kind)
	{
		as_image_set_kind(asImage, kind);
	}

	/**
	 * Sets the locale for this image.
	 *
	 * Params:
	 *     locale = the locale string.
	 *
	 * Since: 0.9.5
	 */
	public void setLocale(string locale)
	{
		as_image_set_locale(asImage, Str.toStringz(locale));
	}

	/**
	 * Sets the fully-qualified mirror URL to use for the image.
	 *
	 * Params:
	 *     url = the URL.
	 */
	public void setUrl(string url)
	{
		as_image_set_url(asImage, Str.toStringz(url));
	}

	/**
	 * Sets the image width.
	 *
	 * Params:
	 *     width = the width in pixels.
	 */
	public void setWidth(uint width)
	{
		as_image_set_width(asImage, width);
	}
}
