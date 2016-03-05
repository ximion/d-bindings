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


module appstream.Provided;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Provided : ObjectG
{
	/** the main GObject struct */
	protected AsProvided* asProvided;

	/** Get the main GObject struct */
	public AsProvided* getProvidedStruct()
	{
		return asProvided;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asProvided;
	}

	protected override void setStruct(GObject* obj)
	{
		asProvided = cast(AsProvided*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsProvided* asProvided, bool ownedRef = false)
	{
		this.asProvided = asProvided;
		super(cast(GObject*)asProvided, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_provided_get_type();
	}

	/**
	 * Creates a new #AsProvided.
	 *
	 * Return: a #AsProvided
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_provided_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsProvided*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     kindStr = the string.
	 *
	 * Return: a #AsProvidedKind or %AS_PROVIDED_KIND_UNKNOWN for unknown
	 */
	public static AsProvidedKind kindFromString(string kindStr)
	{
		return as_provided_kind_from_string(Str.toStringz(kindStr));
	}

	/**
	 * Converts the enumerated value to a localized text representation,
	 * using the plural forms (e.g. "Libraries" instead of "Library").
	 *
	 * This can be useful when displaying provided items in GUI dialogs.
	 *
	 * Params:
	 *     kind = the #AsProvidedKind.
	 *
	 * Return: Pluralized, l10n string version of @kind
	 */
	public static string kindToL10nString(AsProvidedKind kind)
	{
		return Str.toString(as_provided_kind_to_l10n_string(kind));
	}

	/**
	 * Converts the enumerated value to a text representation.
	 *
	 * Params:
	 *     kind = the #AsProvidedKind.
	 *
	 * Return: string version of @kind
	 */
	public static string kindToString(AsProvidedKind kind)
	{
		return Str.toString(as_provided_kind_to_string(kind));
	}

	/**
	 * Add a new provided item.
	 */
	public void addItem(string item)
	{
		as_provided_add_item(asProvided, Str.toStringz(item));
	}

	/**
	 * Get an array of provided data.
	 *
	 * Return: An utf-8 array of provided items, free with g_free()
	 */
	public string[] getItems()
	{
		return Str.toStringArray(as_provided_get_items(asProvided));
	}

	/**
	 * The kind of items this #AsProvided object stores.
	 *
	 * Return: an enum of type #AsProvidedKind
	 */
	public AsProvidedKind getKind()
	{
		return as_provided_get_kind(asProvided);
	}

	/**
	 * Check if the current #AsProvided contains an item
	 * of the given name.
	 *
	 * Params:
	 *     item = the name of a provided item, e.g. "audio/x-vorbis" (in case the provided kind is a mimetype)
	 *
	 * Return: %TRUE if found.
	 */
	public bool hasItem(string item)
	{
		return as_provided_has_item(asProvided, Str.toStringz(item)) != 0;
	}

	/**
	 * Set the kind of items this #AsProvided object stores.
	 *
	 * Params:
	 *     kind = the new #AsProvidedKind
	 */
	public void setKind(AsProvidedKind kind)
	{
		as_provided_set_kind(asProvided, kind);
	}
}
