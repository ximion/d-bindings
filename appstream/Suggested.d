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


module appstream.Suggested;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Suggested : ObjectG
{
	/** the main GObject struct */
	protected AsSuggested* asSuggested;

	/** Get the main GObject struct */
	public AsSuggested* getSuggestedStruct()
	{
		return asSuggested;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asSuggested;
	}

	protected override void setStruct(GObject* obj)
	{
		asSuggested = cast(AsSuggested*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsSuggested* asSuggested, bool ownedRef = false)
	{
		this.asSuggested = asSuggested;
		super(cast(GObject*)asSuggested, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_suggested_get_type();
	}

	/**
	 * Creates a new #AsSuggested.
	 *
	 * Return: a new #AsSuggested
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_suggested_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsSuggested*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     kindStr = the string.
	 *
	 * Return: a #AsSuggestedKind or %AS_SUGGESTED_KIND_UNKNOWN for unknown
	 */
	public static AsSuggestedKind kindFromString(string kindStr)
	{
		return as_suggested_kind_from_string(Str.toStringz(kindStr));
	}

	/**
	 * Converts the enumerated value to an text representation.
	 *
	 * Params:
	 *     kind = the %AsSuggestedKind.
	 *
	 * Return: string version of @kind
	 */
	public static string kindToString(AsSuggestedKind kind)
	{
		return Str.toString(as_suggested_kind_to_string(kind));
	}

	/**
	 * Add a component id to this suggested object.
	 *
	 * Params:
	 *     cid = The component id to add
	 */
	public void addId(string cid)
	{
		as_suggested_add_id(asSuggested, Str.toStringz(cid));
	}

	/**
	 * Get a list of components id that generated the suggestion
	 *
	 * Return: an array of components id
	 */
	public PtrArray getIds()
	{
		auto p = as_suggested_get_ids(asSuggested);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Gets the suggested kind.
	 *
	 * Return: the #AssuggestedKind
	 */
	public AsSuggestedKind getKind()
	{
		return as_suggested_get_kind(asSuggested);
	}

	/**
	 * Check if the essential properties of this suggestion are
	 * populated with useful data.
	 *
	 * Return: %TRUE if we have useful data.
	 */
	public bool isValid()
	{
		return as_suggested_is_valid(asSuggested) != 0;
	}

	/**
	 * Sets the suggested kind.
	 *
	 * Params:
	 *     kind = the #AsSuggestedKind, e.g. %AS_SUGGESTED_KIND_HEURISTIC.
	 */
	public void setKind(AsSuggestedKind kind)
	{
		as_suggested_set_kind(asSuggested, kind);
	}
}
