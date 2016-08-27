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


module appstream.Checksum;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Checksum : ObjectG
{
	/** the main GObject struct */
	protected AsChecksum* asChecksum;

	/** Get the main GObject struct */
	public AsChecksum* getChecksumStruct()
	{
		return asChecksum;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asChecksum;
	}

	protected override void setStruct(GObject* obj)
	{
		asChecksum = cast(AsChecksum*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsChecksum* asChecksum, bool ownedRef = false)
	{
		this.asChecksum = asChecksum;
		super(cast(GObject*)asChecksum, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_checksum_get_type();
	}

	/**
	 * Creates a new #AsChecksum.
	 *
	 * Return: an #AsChecksum
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_checksum_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsChecksum*) p, true);
	}

	/**
	 * Converts the text representation to an enumerated value.
	 *
	 * Params:
	 *     kindStr = the string.
	 *
	 * Return: a #AsChecksumKind or %AS_CHECKSUM_KIND_NONE for unknown
	 */
	public static AsChecksumKind kindFromString(string kindStr)
	{
		return as_checksum_kind_from_string(Str.toStringz(kindStr));
	}

	/**
	 * Converts the enumerated value to an text representation.
	 *
	 * Params:
	 *     kind = the %AsChecksumKind.
	 *
	 * Return: string version of @kind
	 */
	public static string kindToString(AsChecksumKind kind)
	{
		return Str.toString(as_checksum_kind_to_string(kind));
	}

	/**
	 * Gets the checksum type.
	 *
	 * Return: the #AsChecksumKind
	 */
	public AsChecksumKind getKind()
	{
		return as_checksum_get_kind(asChecksum);
	}

	/**
	 * Gets the checksum, usually in its hexadecimal form.
	 *
	 * Return: the checksum.
	 */
	public string getValue()
	{
		return Str.toString(as_checksum_get_value(asChecksum));
	}

	/**
	 * Sets the checksum type.
	 *
	 * Params:
	 *     kind = the #AsChecksumKind, e.g. %AS_CHECKSUM_KIND_SHA256.
	 */
	public void setKind(AsChecksumKind kind)
	{
		as_checksum_set_kind(asChecksum, kind);
	}

	/**
	 * Sets the checksum value filename.
	 *
	 * Params:
	 *     value = the new value.
	 */
	public void setValue(string value)
	{
		as_checksum_set_value(asChecksum, Str.toStringz(value));
	}
}
