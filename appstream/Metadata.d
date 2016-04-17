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


module appstream.Metadata;

private import appstream.Component;
private import gi.appstream;
public  import gi.appstreamtypes;
private import gio.FileIF;
private import glib.ConstructionException;
private import glib.ErrorG;
private import glib.GException;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Metadata : ObjectG
{
	/** the main GObject struct */
	protected AsMetadata* asMetadata;

	/** Get the main GObject struct */
	public AsMetadata* getMetadataStruct()
	{
		return asMetadata;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asMetadata;
	}

	protected override void setStruct(GObject* obj)
	{
		asMetadata = cast(AsMetadata*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsMetadata* asMetadata, bool ownedRef = false)
	{
		this.asMetadata = asMetadata;
		super(cast(GObject*)asMetadata, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_metadata_get_type();
	}

	/**
	 * Creates a new #AsMetadata.
	 *
	 * Return: a #AsMetadata
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_metadata_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsMetadata*) p, true);
	}

	/**
	 * Return: An error quark.
	 */
	public static GQuark errorQuark()
	{
		return as_metadata_error_quark();
	}

	/**
	 * Add an #AsComponent to the list of components.
	 * This can be used to add multiple components in order to
	 * produce a distro-XML AppStream metadata file.
	 */
	public void addComponent(Component cpt)
	{
		as_metadata_add_component(asMetadata, (cpt is null) ? null : cpt.getComponentStruct());
	}

	/** */
	public void clearComponents()
	{
		as_metadata_clear_components(asMetadata);
	}

	/**
	 * Convert an #AsComponent to upstream XML.
	 * (The amount of localization included in the metadata depends on how the #AsComponent
	 * was initially loaded)
	 *
	 * The first #AsComponent added to the internal list will be transformed.
	 * In case no component is present, %NULL is returned.
	 *
	 * Return: A string containing the XML. Free with g_free()
	 */
	public string componentToUpstreamXml()
	{
		return Str.toString(as_metadata_component_to_upstream_xml(asMetadata));
	}

	/**
	 * Serialize all #AsComponent instances into AppStream
	 * distro-XML data.
	 * %NULL is returned if there is nothing to serialize.
	 *
	 * Return: A string containing the XML. Free with g_free()
	 */
	public string componentsToDistroXml()
	{
		return Str.toString(as_metadata_components_to_distro_xml(asMetadata));
	}

	/**
	 * Serialize all #AsComponent instances into AppStream DEP-11
	 * distro-YAML data.
	 * %NULL is returned if there is nothing to serialize.
	 *
	 * Return: A string containing the YAML markup. Free with g_free()
	 */
	public string componentsToDistroYaml()
	{
		return Str.toString(as_metadata_components_to_distro_yaml(asMetadata));
	}

	/**
	 * Return: The architecture of AppStream distro metadata
	 */
	public string getArchitecture()
	{
		return Str.toString(as_metadata_get_architecture(asMetadata));
	}

	/**
	 * Gets the #AsComponent which has been parsed from the XML.
	 * If the AppStream XML contained multiple components, return the first
	 * component that has been parsed.
	 *
	 * Return: An #AsComponent or %NULL
	 */
	public Component getComponent()
	{
		auto p = as_metadata_get_component(asMetadata);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Component)(cast(AsComponent*) p);
	}

	/**
	 * Return: A #GPtrArray of all parsed components
	 */
	public PtrArray getComponents()
	{
		auto p = as_metadata_get_components(asMetadata);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Gets the current active locale for parsing metadata,
	 * or "ALL" if all locales are read.
	 *
	 * Return: Locale used for metadata parsing.
	 */
	public string getLocale()
	{
		return Str.toString(as_metadata_get_locale(asMetadata));
	}

	/**
	 * Return: The origin of AppStream distro metadata
	 */
	public string getOrigin()
	{
		return Str.toString(as_metadata_get_origin(asMetadata));
	}

	/**
	 * Gets the current parser mode
	 *
	 * Return: an #AsParserMode
	 */
	public AsParserMode getParserMode()
	{
		return as_metadata_get_parser_mode(asMetadata);
	}

	/**
	 * Return: Whether existing components should be updates with the parsed data,
	 *     instead of creating new ones.
	 */
	public bool getUpdateExisting()
	{
		return as_metadata_get_update_existing(asMetadata) != 0;
	}

	/**
	 * Return: Whether we will write a header/root node in distro metadata.
	 */
	public bool getWriteHeader()
	{
		return as_metadata_get_write_header(asMetadata) != 0;
	}

	/**
	 * Parses an AppStream upstream metadata file.
	 *
	 * Params:
	 *     file = #GFile for the upstream metadata
	 *
	 * Throws: GException on failure.
	 */
	public void parseFile(FileIF file)
	{
		GError* err = null;
		
		as_metadata_parse_file(asMetadata, (file is null) ? null : file.getFileStruct(), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
	}

	/**
	 * Parses AppStream XML metadata.
	 *
	 * Params:
	 *     data = XML data describing one or more software components.
	 *
	 * Throws: GException on failure.
	 */
	public void parseXml(string data)
	{
		GError* err = null;
		
		as_metadata_parse_xml(asMetadata, Str.toStringz(data), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
	}

	/**
	 * Parses AppStream YAML metadata.
	 *
	 * Params:
	 *     data = YAML data describing one or more software components.
	 *
	 * Throws: GException on failure.
	 */
	public void parseYaml(string data)
	{
		GError* err = null;
		
		as_metadata_parse_yaml(asMetadata, Str.toStringz(data), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
	}

	/**
	 * Serialize all #AsComponent instances to XML and save the data to a file.
	 * An existing file at the same location will be overridden.
	 *
	 * Params:
	 *     fname = The filename for the new XML file.
	 *
	 * Throws: GException on failure.
	 */
	public void saveDistroXml(string fname)
	{
		GError* err = null;
		
		as_metadata_save_distro_xml(asMetadata, Str.toStringz(fname), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
	}

	/**
	 * Serialize all #AsComponent instances to XML and save the data to a file.
	 * An existing file at the same location will be overridden.
	 *
	 * Params:
	 *     fname = The filename for the new YAML file.
	 *
	 * Throws: GException on failure.
	 */
	public void saveDistroYaml(string fname)
	{
		GError* err = null;
		
		as_metadata_save_distro_yaml(asMetadata, Str.toStringz(fname), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
	}

	/**
	 * Serialize #AsComponent instance to XML and save it to file.
	 * An existing file at the same location will be overridden.
	 *
	 * Params:
	 *     fname = The filename for the new XML file.
	 *
	 * Throws: GException on failure.
	 */
	public void saveUpstreamXml(string fname)
	{
		GError* err = null;
		
		as_metadata_save_upstream_xml(asMetadata, Str.toStringz(fname), &err);
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
	}

	/**
	 * Set the architecture the components in this metadata belong to.
	 *
	 * Params:
	 *     arch = an architecture string.
	 */
	public void setArchitecture(string arch)
	{
		as_metadata_set_architecture(asMetadata, Str.toStringz(arch));
	}

	/**
	 * Sets the locale which should be read when processing metadata.
	 * All other locales are ignored, which increases parsing speed and
	 * reduces memory usage.
	 * If you set the locale to "ALL", all locales will be read.
	 *
	 * Params:
	 *     locale = the locale.
	 */
	public void setLocale(string locale)
	{
		as_metadata_set_locale(asMetadata, Str.toStringz(locale));
	}

	/**
	 * Set the origin of AppStream distro metadata
	 *
	 * Params:
	 *     origin = the origin of AppStream distro metadata.
	 */
	public void setOrigin(string origin)
	{
		as_metadata_set_origin(asMetadata, Str.toStringz(origin));
	}

	/**
	 * Sets the current metadata parsing mode.
	 *
	 * Params:
	 *     mode = the #AsParserMode.
	 */
	public void setParserMode(AsParserMode mode)
	{
		as_metadata_set_parser_mode(asMetadata, mode);
	}

	/**
	 * If set to %TRUE, the parser will not create new components but
	 * instead update existing components in the pool with new metadata.
	 *
	 * NOTE: Right now, this feature is only implemented for metainfo XML parsing!
	 *
	 * Params:
	 *     update = A boolean value.
	 */
	public void setUpdateExisting(bool update)
	{
		as_metadata_set_update_existing(asMetadata, update);
	}

	/**
	 * If set to %TRUE, tehe metadata writer will omit writing a DEP-11
	 * header document when in YAML mode, and will not write a root components node
	 * when writing XML data.
	 * Please keep in mind that this will create an invalid DEP-11 YAML AppStream
	 * distro metadata file, and an invalid XML file.
	 * This parameter should only be changed e.g. by the appstream-generator tool.
	 *
	 * NOTE: Right now, this feature is only implemented for YAML!
	 *
	 * Params:
	 *     wheader = A boolean value.
	 */
	public void setWriteHeader(bool wheader)
	{
		as_metadata_set_write_header(asMetadata, wheader);
	}
}
