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


module appstream.Validator;

private import gi.appstream;
public  import gi.appstreamtypes;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ListG;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Validator : ObjectG
{
	/** the main GObject struct */
	protected AsValidator* asValidator;

	/** Get the main GObject struct */
	public AsValidator* getValidatorStruct()
	{
		return asValidator;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asValidator;
	}

	protected override void setStruct(GObject* obj)
	{
		asValidator = cast(AsValidator*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsValidator* asValidator, bool ownedRef = false)
	{
		this.asValidator = asValidator;
		super(cast(GObject*)asValidator, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_validator_get_type();
	}

	/**
	 * Creates a new #AsValidator.
	 *
	 * Return: an #AsValidator
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_validator_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsValidator*) p, true);
	}

	/**
	 * Clears the list of issues
	 */
	public void clearIssues()
	{
		as_validator_clear_issues(asValidator);
	}

	/**
	 * Get a list of found metadata format issues.
	 *
	 * Return: a list of #AsValidatorIssue instances, free with g_list_free()
	 */
	public ListG getIssues()
	{
		auto p = as_validator_get_issues(asValidator);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListG(cast(GList*) p);
	}

	/**
	 * Validate AppStream XML data
	 *
	 * Params:
	 *     metadata = XML metadata.
	 */
	public bool validateData(string metadata)
	{
		return as_validator_validate_data(asValidator, Str.toStringz(metadata)) != 0;
	}

	/**
	 * Validate an AppStream XML file
	 *
	 * Params:
	 *     metadataFile = An AppStream XML file.
	 */
	public bool validateFile(FileIF metadataFile)
	{
		return as_validator_validate_file(asValidator, (metadataFile is null) ? null : metadataFile.getFileStruct()) != 0;
	}

	/**
	 * Validate a full directory tree for issues in AppStream metadata.
	 *
	 * Params:
	 *     rootDir = The root directory of the filesystem tree that should be validated.
	 */
	public bool validateTree(string rootDir)
	{
		return as_validator_validate_tree(asValidator, Str.toStringz(rootDir)) != 0;
	}
}
