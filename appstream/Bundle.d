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


module appstream.Bundle;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Bundle : ObjectG
{
	/** the main GObject struct */
	protected AsBundle* asBundle;

	/** Get the main GObject struct */
	public AsBundle* getBundleStruct()
	{
		return asBundle;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asBundle;
	}

	protected override void setStruct(GObject* obj)
	{
		asBundle = cast(AsBundle*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsBundle* asBundle, bool ownedRef = false)
	{
		this.asBundle = asBundle;
		super(cast(GObject*)asBundle, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_bundle_get_type();
	}

	/**
	 * Creates a new #AsBundle.
	 *
	 * Return: a #AsBundle
	 *
	 * Since: 0.10
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_bundle_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsBundle*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     bundleStr = the string.
	 *
	 * Return: a #AsBundleKind or %AS_BUNDLE_KIND_UNKNOWN for unknown
	 */
	public static AsBundleKind kindFromString(string bundleStr)
	{
		return as_bundle_kind_from_string(Str.toStringz(bundleStr));
	}

	/**
	 * Converts the enumerated value to an text representation.
	 *
	 * Params:
	 *     kind = the %AsBundleKind.
	 *
	 * Return: string version of @kind
	 *
	 * Since: 0.8.0
	 */
	public static string kindToString(AsBundleKind kind)
	{
		return Str.toString(as_bundle_kind_to_string(kind));
	}

	/**
	 * Gets the ID for this bundle.
	 *
	 * Return: ID, e.g. "foobar-1.0.2"
	 *
	 * Since: 0.10
	 */
	public string getId()
	{
		return Str.toString(as_bundle_get_id(asBundle));
	}

	/**
	 * Gets the bundle kind.
	 *
	 * Return: the #AsBundleKind
	 *
	 * Since: 0.10
	 */
	public AsBundleKind getKind()
	{
		return as_bundle_get_kind(asBundle);
	}

	/**
	 * Sets the ID for this bundle.
	 *
	 * Params:
	 *     id = the URL.
	 *
	 * Since: 0.10
	 */
	public void setId(string id)
	{
		as_bundle_set_id(asBundle, Str.toStringz(id));
	}

	/**
	 * Sets the bundle kind.
	 *
	 * Params:
	 *     kind = the #AsBundleKind, e.g. %AS_BUNDLE_KIND_LIMBA.
	 *
	 * Since: 0.10
	 */
	public void setKind(AsBundleKind kind)
	{
		as_bundle_set_kind(asBundle, kind);
	}
}
