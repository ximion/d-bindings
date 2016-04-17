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


module appstream.Component;

private import appstream.Icon;
private import appstream.Provided;
private import appstream.Release;
private import appstream.Screenshot;
private import appstream.Translation;
private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.ListG;
private import glib.PtrArray;
private import glib.Str;
private import gobject.ObjectG;


/** */
public class Component : ObjectG
{
	/** the main GObject struct */
	protected AsComponent* asComponent;

	/** Get the main GObject struct */
	public AsComponent* getComponentStruct()
	{
		return asComponent;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)asComponent;
	}

	protected override void setStruct(GObject* obj)
	{
		asComponent = cast(AsComponent*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (AsComponent* asComponent, bool ownedRef = false)
	{
		this.asComponent = asComponent;
		super(cast(GObject*)asComponent, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return as_component_get_type();
	}

	/**
	 * Creates a new #AsComponent.
	 *
	 * Return: a new #AsComponent
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this()
	{
		auto p = as_component_new();
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(AsComponent*) p, true);
	}

	/**
	 * Adds a bundle identifier to the component.
	 *
	 * Params:
	 *     bundleKind = the URL kind, e.g. %AS_BUNDLE_KIND_LIMBA
	 *     id = The bundle identification string
	 *
	 * Since: 0.8.0
	 */
	public void addBundleId(AsBundleKind bundleKind, string id)
	{
		as_component_add_bundle_id(asComponent, bundleKind, Str.toStringz(id));
	}

	/**
	 * Add a reference to the extended component
	 *
	 * Params:
	 *     cptId = The id of a component which is extended by this component
	 *
	 * Since: 0.7.0
	 */
	public void addExtends(string cptId)
	{
		as_component_add_extends(asComponent, Str.toStringz(cptId));
	}

	/**
	 * Add a reference to the extension enhancing this component.
	 *
	 * Params:
	 *     cptId = The id of a component extending this component.
	 *
	 * Since: 0.9.2
	 */
	public void addExtension(string cptId)
	{
		as_component_add_extension(asComponent, Str.toStringz(cptId));
	}

	/**
	 * Add an icon to this component.
	 *
	 * Params:
	 *     icon = the valid #AsIcon instance to add.
	 */
	public void addIcon(Icon icon)
	{
		as_component_add_icon(asComponent, (icon is null) ? null : icon.getIconStruct());
	}

	/**
	 * Adds a language to the component.
	 *
	 * Params:
	 *     locale = the locale, or %NULL. e.g. "en_GB"
	 *     percentage = the percentage completion of the translation, 0 for locales with unknown amount of translation
	 *
	 * Since: 0.7.0
	 */
	public void addLanguage(string locale, int percentage)
	{
		as_component_add_language(asComponent, Str.toStringz(locale), percentage);
	}

	/**
	 * Add a set of provided items to this component.
	 *
	 * Params:
	 *     prov = a #AsProvided instance.
	 *
	 * Since: 0.6.2
	 */
	public void addProvided(Provided prov)
	{
		as_component_add_provided(asComponent, (prov is null) ? null : prov.getProvidedStruct());
	}

	/**
	 * Add an #AsRelease to this component.
	 *
	 * Params:
	 *     release = The #AsRelease to add
	 */
	public void addRelease(Release release)
	{
		as_component_add_release(asComponent, (release is null) ? null : release.getReleaseStruct());
	}

	/**
	 * Add an #AsScreenshot to this component.
	 *
	 * Params:
	 *     sshot = The #AsScreenshot to add
	 */
	public void addScreenshot(Screenshot sshot)
	{
		as_component_add_screenshot(asComponent, (sshot is null) ? null : sshot.getScreenshotStruct());
	}

	/**
	 * Assign an #AsTranslation object describing the translation system used
	 * by this component.
	 *
	 * Params:
	 *     tr = an #AsTranslation instance.
	 *
	 * Since: 0.9.2
	 */
	public void addTranslation(Translation tr)
	{
		as_component_add_translation(asComponent, (tr is null) ? null : tr.getTranslationStruct());
	}

	/**
	 * Adds some URL data to the component.
	 *
	 * Params:
	 *     urlKind = the URL kind, e.g. %AS_URL_KIND_HOMEPAGE
	 *     url = the full URL.
	 *
	 * Since: 0.6.2
	 */
	public void addUrl(AsUrlKind urlKind, string url)
	{
		as_component_add_url(asComponent, urlKind, Str.toStringz(url));
	}

	/**
	 * Get the current active locale for this component, which
	 * is used to get localized messages.
	 *
	 * Return: the current active locale.
	 */
	public string getActiveLocale()
	{
		return Str.toString(as_component_get_active_locale(asComponent));
	}

	/**
	 * Gets a bundle identifier string.
	 *
	 * Params:
	 *     bundleKind = the bundle kind, e.g. %AS_BUNDLE_KIND_LIMBA.
	 *
	 * Return: string, or %NULL if unset
	 *
	 * Since: 0.8.0
	 */
	public string getBundleId(AsBundleKind bundleKind)
	{
		return Str.toString(as_component_get_bundle_id(asComponent, bundleKind));
	}

	/**
	 * Return: String array of categories
	 */
	public string[] getCategories()
	{
		return Str.toStringArray(as_component_get_categories(asComponent));
	}

	/**
	 * Return: A list of desktops where this component is compulsory
	 */
	public string[] getCompulsoryForDesktops()
	{
		return Str.toStringArray(as_component_get_compulsory_for_desktops(asComponent));
	}

	/**
	 * Get the localized long description of this component.
	 *
	 * Return: the description.
	 */
	public string getDescription()
	{
		return Str.toString(as_component_get_description(asComponent));
	}

	/**
	 * Get the component's developer or development team name.
	 *
	 * Return: the developer name.
	 */
	public string getDeveloperName()
	{
		return Str.toString(as_component_get_developer_name(asComponent));
	}

	/**
	 * Returns a string list of IDs of components which
	 * are extended by this addon.
	 *
	 * See %as_component_get_extends() for the reverse.
	 *
	 * Return: A #GPtrArray or %NULL if not set.
	 *
	 * Since: 0.7.0
	 */
	public PtrArray getExtends()
	{
		auto p = as_component_get_extends(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Returns a string list of IDs of components which
	 * are addons extending this component in functionality.
	 *
	 * This is the reverse of %as_component_get_extends()
	 *
	 * Return: A #GPtrArray or %NULL if not set.
	 *
	 * Since: 0.9.2
	 */
	public PtrArray getExtensions()
	{
		auto p = as_component_get_extensions(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Gets an icon matching the size constraints.
	 * The icons are not filtered by type, and the first icon
	 * which matches the size is returned.
	 * If you want more control over which icons you use for displaying,
	 * use the as_component_get_icons() function to get a list of all icons.
	 *
	 * Params:
	 *     width = The icon width in pixels.
	 *     height = the icon height in pixels.
	 *
	 * Return: An icon matching the given width/height, or %NULL if not found.
	 */
	public Icon getIconBySize(uint width, uint height)
	{
		auto p = as_component_get_icon_by_size(asComponent, width, height);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon)(cast(AsIcon*) p);
	}

	/**
	 * Return: A #GPtrArray of all icons for this component.
	 */
	public PtrArray getIcons()
	{
		auto p = as_component_get_icons(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Set the unique identifier for this component.
	 *
	 * Return: the unique identifier.
	 */
	public string getId()
	{
		return Str.toString(as_component_get_id(asComponent));
	}

	/**
	 * Return: String array of keywords
	 */
	public string[] getKeywords()
	{
		return Str.toStringArray(as_component_get_keywords(asComponent));
	}

	/**
	 * Returns the #AsComponentKind of this component.
	 *
	 * Return: the kind of #this.
	 */
	public AsComponentKind getKind()
	{
		return as_component_get_kind(asComponent);
	}

	/**
	 * Gets the translation coverage in percent for a specific locale
	 *
	 * Params:
	 *     locale = the locale, or %NULL. e.g. "en_GB"
	 *
	 * Return: a percentage value, -1 if locale was not found
	 *
	 * Since: 0.7.0
	 */
	public int getLanguage(string locale)
	{
		return as_component_get_language(asComponent, Str.toStringz(locale));
	}

	/**
	 * Get a list of all languages.
	 *
	 * Return: list of locales
	 *
	 * Since: 0.7.0
	 */
	public ListG getLanguages()
	{
		auto p = as_component_get_languages(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListG(cast(GList*) p);
	}

	/**
	 * A human-readable name for this component.
	 *
	 * Return: the name.
	 */
	public string getName()
	{
		return Str.toString(as_component_get_name(asComponent));
	}

	/** */
	public string getOrigin()
	{
		return Str.toString(as_component_get_origin(asComponent));
	}

	/**
	 * Get a list of package names which this component consists of.
	 * This usually is just one package name.
	 *
	 * Return: String array of package names
	 */
	public string[] getPkgnames()
	{
		return Str.toStringArray(as_component_get_pkgnames(asComponent));
	}

	/**
	 * Get the component's project group.
	 *
	 * Return: the project group.
	 */
	public string getProjectGroup()
	{
		return Str.toString(as_component_get_project_group(asComponent));
	}

	/**
	 * Get the license of the project this component belongs to.
	 *
	 * Return: the license.
	 */
	public string getProjectLicense()
	{
		return Str.toString(as_component_get_project_license(asComponent));
	}

	/**
	 * Get a list of #AsProvided objects associated with this component.
	 *
	 * Return: A list of #AsProvided objects.
	 */
	public ListG getProvided()
	{
		auto p = as_component_get_provided(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new ListG(cast(GList*) p);
	}

	/**
	 * Get an #AsProvided object for the given interface type,
	 * containing information about the public interfaces (mimetypes, firmware, DBus services, ...)
	 * this component provides.
	 *
	 * Params:
	 *     kind = kind of the provided item, e.g. %AS_PROVIDED_KIND_MIMETYPE
	 *
	 * Return: #AsProvided containing the items this component provides, or %NULL.
	 */
	public Provided getProvidedForKind(AsProvidedKind kind)
	{
		auto p = as_component_get_provided_for_kind(asComponent, kind);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Provided)(cast(AsProvided*) p);
	}

	/**
	 * Get an array of the #AsRelease items this component
	 * provides.
	 *
	 * Return: A list of releases
	 */
	public PtrArray getReleases()
	{
		auto p = as_component_get_releases(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Get a list of associated screenshots.
	 *
	 * Return: an array of #AsScreenshot instances
	 */
	public PtrArray getScreenshots()
	{
		auto p = as_component_get_screenshots(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Return: the source package name.
	 */
	public string getSourcePkgname()
	{
		return Str.toString(as_component_get_source_pkgname(asComponent));
	}

	/**
	 * Get a short description of this component.
	 *
	 * Return: the summary.
	 */
	public string getSummary()
	{
		return Str.toString(as_component_get_summary(asComponent));
	}

	/**
	 * Get a #GPtrArray of #AsTranslation objects describing the
	 * translation systems and translation-ids (e.g. Gettext domains) used
	 * by this software component.
	 *
	 * Only set for metainfo files.
	 *
	 * Return: An array of #AsTranslation objects.
	 *
	 * Since: 0.9.2
	 */
	public PtrArray getTranslations()
	{
		auto p = as_component_get_translations(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Gets a URL.
	 *
	 * Params:
	 *     urlKind = the URL kind, e.g. %AS_URL_KIND_HOMEPAGE.
	 *
	 * Return: string, or %NULL if unset
	 *
	 * Since: 0.6.2
	 */
	public string getUrl(AsUrlKind urlKind)
	{
		return Str.toString(as_component_get_url(asComponent, urlKind));
	}

	/**
	 * Return: %TRUE if this component has a bundle-id associated.
	 */
	public bool hasBundle()
	{
		return as_component_has_bundle(asComponent) != 0;
	}

	/**
	 * Check if component is in the specified category.
	 *
	 * Params:
	 *     category = the specified category to check
	 *
	 * Return: %TRUE if the component is in the specified category.
	 */
	public bool hasCategory(string category)
	{
		return as_component_has_category(asComponent, Str.toStringz(category)) != 0;
	}

	/**
	 * Check if this component is compulsory for the given desktop.
	 *
	 * Params:
	 *     desktop = the desktop-id to test for
	 *
	 * Return: %TRUE if compulsory, %FALSE otherwise.
	 */
	public bool isCompulsoryForDesktop(string desktop)
	{
		return as_component_is_compulsory_for_desktop(asComponent, Str.toStringz(desktop)) != 0;
	}

	/**
	 * Check if the essential properties of this Component are
	 * populated with useful data.
	 *
	 * Return: TRUE if the component data was validated successfully.
	 */
	public bool isValid()
	{
		return as_component_is_valid(asComponent) != 0;
	}

	/**
	 * Set the current active locale for this component, which
	 * is used to get localized messages.
	 * If the #AsComponent was fetched from a localized database, usually only
	 * one locale is available.
	 *
	 * Params:
	 *     locale = the locale, or %NULL. e.g. "en_GB"
	 */
	public void setActiveLocale(string locale)
	{
		as_component_set_active_locale(asComponent, Str.toStringz(locale));
	}

	/** */
	public void setCategories(string[] value)
	{
		as_component_set_categories(asComponent, Str.toStringzArray(value));
	}

	/**
	 * Set a list of desktops where this component is compulsory.
	 *
	 * Params:
	 *     value = the array of desktop ids.
	 */
	public void setCompulsoryForDesktops(string[] value)
	{
		as_component_set_compulsory_for_desktops(asComponent, Str.toStringzArray(value));
	}

	/**
	 * Set long description for this component.
	 *
	 * Params:
	 *     value = The long description
	 *     locale = The locale the used for this value, or %NULL to use the current active one.
	 */
	public void setDescription(string value, string locale)
	{
		as_component_set_description(asComponent, Str.toStringz(value), Str.toStringz(locale));
	}

	/**
	 * Set the the component's developer or development team name.
	 *
	 * Params:
	 *     value = the developer or developer team name
	 *     locale = the locale, or %NULL. e.g. "en_GB"
	 */
	public void setDeveloperName(string value, string locale)
	{
		as_component_set_developer_name(asComponent, Str.toStringz(value), Str.toStringz(locale));
	}

	/**
	 * Set the unique identifier for this component.
	 *
	 * Params:
	 *     value = the unique identifier.
	 */
	public void setId(string value)
	{
		as_component_set_id(asComponent, Str.toStringz(value));
	}

	/**
	 * Set keywords for this component.
	 *
	 * Params:
	 *     value = String-array of keywords
	 *     locale = Locale of the values, or %NULL to use current locale.
	 */
	public void setKeywords(string[] value, string locale)
	{
		as_component_set_keywords(asComponent, Str.toStringzArray(value), Str.toStringz(locale));
	}

	/**
	 * Sets the #AsComponentKind of this component.
	 *
	 * Params:
	 *     value = the #AsComponentKind.
	 */
	public void setKind(AsComponentKind value)
	{
		as_component_set_kind(asComponent, value);
	}

	/**
	 * Set a human-readable name for this component.
	 *
	 * Params:
	 *     value = The name
	 *     locale = The locale the used for this value, or %NULL to use the current active one.
	 */
	public void setName(string value, string locale)
	{
		as_component_set_name(asComponent, Str.toStringz(value), Str.toStringz(locale));
	}

	/** */
	public void setOrigin(string origin)
	{
		as_component_set_origin(asComponent, Str.toStringz(origin));
	}

	/**
	 * Set a list of package names this component consists of.
	 * (This should usually be just one package name)
	 */
	public void setPkgnames(string[] value)
	{
		as_component_set_pkgnames(asComponent, Str.toStringzArray(value));
	}

	/**
	 * Set the component's project group.
	 *
	 * Params:
	 *     value = the project group.
	 */
	public void setProjectGroup(string value)
	{
		as_component_set_project_group(asComponent, Str.toStringz(value));
	}

	/**
	 * Set the project license.
	 *
	 * Params:
	 *     value = the project license.
	 */
	public void setProjectLicense(string value)
	{
		as_component_set_project_license(asComponent, Str.toStringz(value));
	}

	/** */
	public void setSourcePkgname(string spkgname)
	{
		as_component_set_source_pkgname(asComponent, Str.toStringz(spkgname));
	}

	/**
	 * Set a short description for this component.
	 *
	 * Params:
	 *     value = The summary
	 *     locale = The locale the used for this value, or %NULL to use the current active one.
	 */
	public void setSummary(string value, string locale)
	{
		as_component_set_summary(asComponent, Str.toStringz(value), Str.toStringz(locale));
	}

	/**
	 * Returns a string identifying this component.
	 * (useful for debugging)
	 *
	 * Return: A descriptive string
	 */
	public override string toString()
	{
		return Str.toString(as_component_to_string(asComponent));
	}
}
