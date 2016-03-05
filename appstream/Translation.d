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


module appstream.Translation;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Translation : ObjectG
{
	/** the main GObject struct */
	protected AsTranslation* asTranslation;

	/** Get the main GObject struct */
	public AsTranslation* getTranslationStruct()
	{
		return asTranslation;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asTranslation;
	}

	protected override void setStruct(GObject* obj)
	{
		asTranslation = cast(AsTranslation*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsTranslation* asTranslation, bool ownedRef = false)
	{
		this.asTranslation = asTranslation;
		super(cast(GObject*)asTranslation, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_translation_get_type();
	}

	/**
	 * Creates a new #AsTranslation.
	 *
	 * Return: a #AsTranslation
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_translation_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsTranslation*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     kindStr = the string.
	 *
	 * Return: a #AsTranslationKind or %AS_TRANSLATION_KIND_UNKNOWN for unknown
	 */
	public static AsTranslationKind kindFromString(string kindStr)
	{
		return as_translation_kind_from_string(Str.toStringz(kindStr));
	}

	/**
	 * Converts the enumerated value to a text representation.
	 *
	 * Params:
	 *     kind = the #AsTranslationKind.
	 *
	 * Return: string version of @kind
	 */
	public static string kindToString(AsTranslationKind kind)
	{
		return Str.toString(as_translation_kind_to_string(kind));
	}

	/**
	 * The ID (e.g. Gettext translation domain) of this translation.
	 */
	public string getId()
	{
		return Str.toString(as_translation_get_id(asTranslation));
	}

	/**
	 * The translation system type.
	 *
	 * Return: an enum of type #AsTranslationKind
	 */
	public AsTranslationKind getKind()
	{
		return as_translation_get_kind(asTranslation);
	}

	/**
	 * Set the ID (e.g. Gettext domain) of this translation.
	 *
	 * Params:
	 *     id = The ID of this translation.
	 */
	public void setId(string id)
	{
		as_translation_set_id(asTranslation, Str.toStringz(id));
	}

	/**
	 * Set the translation system type.
	 *
	 * Params:
	 *     kind = the new #AsTranslationKind
	 */
	public void setKind(AsTranslationKind kind)
	{
		as_translation_set_kind(asTranslation, kind);
	}
}
