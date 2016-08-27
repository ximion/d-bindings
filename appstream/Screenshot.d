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


module appstream.Screenshot;

private import appstream.Image;
private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Screenshot : ObjectG
{
	/** the main GObject struct */
	protected AsScreenshot* asScreenshot;

	/** Get the main GObject struct */
	public AsScreenshot* getScreenshotStruct()
	{
		return asScreenshot;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asScreenshot;
	}

	protected override void setStruct(GObject* obj)
	{
		asScreenshot = cast(AsScreenshot*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsScreenshot* asScreenshot, bool ownedRef = false)
	{
		this.asScreenshot = asScreenshot;
		super(cast(GObject*)asScreenshot, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_screenshot_get_type();
	}

	/**
	 * Creates a new #AsScreenshot.
	 *
	 * Return: a #AsScreenshot
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_screenshot_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsScreenshot*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     kind = the string.
	 *
	 * Return: a %AsScreenshotKind, or %AS_SCREENSHOT_KIND_UNKNOWN if not known.
	 */
	public static AsScreenshotKind kindFromString(string kind)
	{
		return as_screenshot_kind_from_string(Str.toStringz(kind));
	}

	/**
	 * Converts the enumerated value to an text representation.
	 *
	 * Params:
	 *     kind = the #AsScreenshotKind.
	 *
	 * Return: string version of @kind
	 */
	public static string kindToString(AsScreenshotKind kind)
	{
		return Str.toString(as_screenshot_kind_to_string(kind));
	}

	/**
	 * Adds an image to the screenshot.
	 *
	 * Params:
	 *     image = a #AsImage instance.
	 */
	public void addImage(Image image)
	{
		as_screenshot_add_image(asScreenshot, (image is null) ? null : image.getImageStruct());
	}

	/**
	 * Get the current active locale, which
	 * is used to get localized messages.
	 */
	public string getActiveLocale()
	{
		return Str.toString(as_screenshot_get_active_locale(asScreenshot));
	}

	/**
	 * Gets the image caption
	 *
	 * Return: the caption
	 */
	public string getCaption()
	{
		return Str.toString(as_screenshot_get_caption(asScreenshot));
	}

	/**
	 * Gets the images for this screenshots. Only images valid for the current
	 * language are returned. We return all sizes.
	 *
	 * Return: an array
	 */
	public PtrArray getImages()
	{
		auto p = as_screenshot_get_images(asScreenshot);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Returns an array of all images we have, regardless of their
	 * size and language.
	 *
	 * Return: an array
	 *
	 * Since: 0.10
	 */
	public PtrArray getImagesAll()
	{
		auto p = as_screenshot_get_images_all(asScreenshot);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Gets the screenshot kind.
	 *
	 * Return: a #AsScreenshotKind
	 */
	public AsScreenshotKind getKind()
	{
		return as_screenshot_get_kind(asScreenshot);
	}

	/**
	 * Performs a quick validation on this screenshot
	 *
	 * Return: TRUE if the screenshot is a complete #AsScreenshot
	 */
	public bool isValid()
	{
		return as_screenshot_is_valid(asScreenshot) != 0;
	}

	/**
	 * Set the current active locale, which
	 * is used to get localized messages.
	 * If the #AsComponent linking this #AsScreenshot was fetched
	 * from a localized database, usually only
	 * one locale is available.
	 */
	public void setActiveLocale(string locale)
	{
		as_screenshot_set_active_locale(asScreenshot, Str.toStringz(locale));
	}

	/**
	 * Sets a caption on the screenshot
	 *
	 * Params:
	 *     caption = the caption text.
	 */
	public void setCaption(string caption, string locale)
	{
		as_screenshot_set_caption(asScreenshot, Str.toStringz(caption), Str.toStringz(locale));
	}

	/**
	 * Sets the screenshot kind.
	 *
	 * Params:
	 *     kind = the #AsScreenshotKind.
	 */
	public void setKind(AsScreenshotKind kind)
	{
		as_screenshot_set_kind(asScreenshot, kind);
	}
}
