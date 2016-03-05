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


module appstream.Release;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Release : ObjectG
{
	/** the main GObject struct */
	protected AsRelease* asRelease;

	/** Get the main GObject struct */
	public AsRelease* getReleaseStruct()
	{
		return asRelease;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asRelease;
	}

	protected override void setStruct(GObject* obj)
	{
		asRelease = cast(AsRelease*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsRelease* asRelease, bool ownedRef = false)
	{
		this.asRelease = asRelease;
		super(cast(GObject*)asRelease, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_release_get_type();
	}

	/**
	 * Creates a new #AsRelease.
	 *
	 * Return: a #AsRelease
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_release_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsRelease*) p, true);
	}

	/**
	 * Adds a release location.
	 *
	 * Params:
	 *     location = An URL of the download location
	 *
	 * Since: 0.8.1
	 */
	public void addLocation(string location)
	{
		as_release_add_location(asRelease, Str.toStringz(location));
	}

	/**
	 * Get the current active locale, which
	 * is used to get localized messages.
	 */
	public string getActiveLocale()
	{
		return Str.toString(as_release_get_active_locale(asRelease));
	}

	/**
	 * Gets the release checksum
	 *
	 * Return: string, or %NULL for not set or invalid
	 *
	 * Since: 0.8.2
	 */
	public string getChecksum(AsChecksumKind kind)
	{
		return Str.toString(as_release_get_checksum(asRelease, kind));
	}

	/**
	 * Gets the release description markup for a given locale.
	 *
	 * Return: markup, or %NULL for not set or invalid
	 */
	public string getDescription()
	{
		return Str.toString(as_release_get_description(asRelease));
	}

	/**
	 * Gets the release locations, typically URLs.
	 *
	 * Return: list of locations
	 *
	 * Since: 0.8.1
	 */
	public PtrArray getLocations()
	{
		auto p = as_release_get_locations(asRelease);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Gets the release size.
	 *
	 * Params:
	 *     kind = a #AsSizeKind
	 *
	 * Return: The size of the given kind of this release.
	 *
	 * Since: 0.8.6
	 */
	public ulong getSize(AsSizeKind kind)
	{
		return as_release_get_size(asRelease, kind);
	}

	/**
	 * Gets the release timestamp.
	 *
	 * Return: timestamp, or 0 for unset
	 */
	public ulong getTimestamp()
	{
		return as_release_get_timestamp(asRelease);
	}

	/**
	 * Gets the urgency of the release
	 * (showing how important it is to update to a more recent release)
	 *
	 * Return: #AsUrgencyKind, or %AS_URGENCY_KIND_UNKNOWN for not set
	 *
	 * Since: 0.6.5
	 */
	public AsUrgencyKind getUrgency()
	{
		return as_release_get_urgency(asRelease);
	}

	/**
	 * Gets the release version.
	 *
	 * Return: string, or %NULL for not set or invalid
	 */
	public string getVersion()
	{
		return Str.toString(as_release_get_version(asRelease));
	}

	/**
	 * Set the current active locale, which
	 * is used to get localized messages.
	 * If the #AsComponent linking this #AsRelease was fetched
	 * from a localized database, usually only
	 * one locale is available.
	 */
	public void setActiveLocale(string locale)
	{
		as_release_set_active_locale(asRelease, Str.toStringz(locale));
	}

	/**
	 * Set the release checksum.
	 *
	 * Params:
	 *     checksum = The checksum as string.
	 *     kind = The kind of this checksum, e.g. %AS_CHECKSUM_KIND_SHA256
	 *
	 * Since: 0.8.2
	 */
	public void setChecksum(string checksum, AsChecksumKind kind)
	{
		as_release_set_checksum(asRelease, Str.toStringz(checksum), kind);
	}

	/**
	 * Sets the description release markup.
	 *
	 * Params:
	 *     description = the description markup.
	 */
	public void setDescription(string description, string locale)
	{
		as_release_set_description(asRelease, Str.toStringz(description), Str.toStringz(locale));
	}

	/**
	 * Sets the release size for the given kind.
	 *
	 * Params:
	 *     size = a size in bytes, or 0 for unknown
	 *     kind = a #AsSizeKind
	 *
	 * Since: 0.8.6
	 */
	public void setSize(ulong size, AsSizeKind kind)
	{
		as_release_set_size(asRelease, size, kind);
	}

	/**
	 * Sets the release timestamp.
	 *
	 * Params:
	 *     timestamp = the timestamp value.
	 */
	public void setTimestamp(ulong timestamp)
	{
		as_release_set_timestamp(asRelease, timestamp);
	}

	/**
	 * Sets the release urgency.
	 *
	 * Params:
	 *     urgency = the urgency of this release/update (as #AsUrgencyKind)
	 *
	 * Since: 0.6.5
	 */
	public void setUrgency(AsUrgencyKind urgency)
	{
		as_release_set_urgency(asRelease, urgency);
	}

	/**
	 * Sets the release version.
	 *
	 * Params:
	 *     versio = the version string.
	 */
	public void setVersion(string versio)
	{
		as_release_set_version(asRelease, Str.toStringz(versio));
	}
}
