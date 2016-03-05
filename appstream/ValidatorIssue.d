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


module appstream.ValidatorIssue;

private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class ValidatorIssue : ObjectG
{
	/** the main GObject struct */
	protected AsValidatorIssue* asValidatorIssue;

	/** Get the main GObject struct */
	public AsValidatorIssue* getValidatorIssueStruct()
	{
		return asValidatorIssue;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asValidatorIssue;
	}

	protected override void setStruct(GObject* obj)
	{
		asValidatorIssue = cast(AsValidatorIssue*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsValidatorIssue* asValidatorIssue, bool ownedRef = false)
	{
		this.asValidatorIssue = asValidatorIssue;
		super(cast(GObject*)asValidatorIssue, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_validator_issue_get_type();
	}

	/**
	 * Creates a new #AsValidatorIssue.
	 *
	 * Return: a #AsValidatorIssue
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_validator_issue_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsValidatorIssue*) p, true);
	}

	/**
	 * Gets the importance of this issue.
	 *
	 * Return: a #AsIssueImportance
	 */
	public AsIssueImportance getImportance()
	{
		return as_validator_issue_get_importance(asValidatorIssue);
	}

	/**
	 * Gets the issue kind enum, if available.
	 *
	 * Return: a #AsIssueKind
	 */
	public AsIssueKind getKind()
	{
		return as_validator_issue_get_kind(asValidatorIssue);
	}

	/**
	 * Gets a location hint for the issue.
	 *
	 * Return: the location hint
	 */
	public string getLocation()
	{
		return Str.toString(as_validator_issue_get_location(asValidatorIssue));
	}

	/**
	 * Gets the message for the issue.
	 *
	 * Return: the message
	 */
	public string getMessage()
	{
		return Str.toString(as_validator_issue_get_message(asValidatorIssue));
	}

	/**
	 * Sets the importance for this issue.
	 *
	 * Params:
	 *     importance = the #AsIssueImportance.
	 */
	public void setImportance(AsIssueImportance importance)
	{
		as_validator_issue_set_importance(asValidatorIssue, importance);
	}

	/**
	 * Sets the kind enum for this issue, if known.
	 *
	 * Params:
	 *     kind = the #AsIssueKind.
	 */
	public void setKind(AsIssueKind kind)
	{
		as_validator_issue_set_kind(asValidatorIssue, kind);
	}

	/**
	 * Sets a location hint for this issue.
	 *
	 * Params:
	 *     location = a location hint.
	 */
	public void setLocation(string location)
	{
		as_validator_issue_set_location(asValidatorIssue, Str.toStringz(location));
	}

	/**
	 * Sets a message on the issue.
	 *
	 * Params:
	 *     message = the message text.
	 */
	public void setMessage(string message)
	{
		as_validator_issue_set_message(asValidatorIssue, Str.toStringz(message));
	}
}
