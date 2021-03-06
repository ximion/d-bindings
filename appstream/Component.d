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

private import appstream.Bundle;
private import appstream.Category;
private import appstream.Icon;
private import appstream.Provided;
private import appstream.Release;
private import appstream.Screenshot;
private import appstream.Suggested;
private import appstream.Translation;
private import gi.appstream;
public  import gi.appstreamtypes;
private import glib.ConstructionException;
private import glib.HashTable;
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
	 * Add a reference to the addon that is enhancing this component.
	 *
	 * Params:
	 *     addon = The #AsComponent that extends @cpt
	 *
	 * Since: 0.9.2
	 */
	public void addAddon(Component addon)
	{
		as_component_add_addon(asComponent, (addon is null) ? null : addon.getComponentStruct());
	}

	/**
	 * Adds a bundle to the component.
	 *
	 * Params:
	 *     bundle = The #AsBundle to add.
	 *
	 * Since: 0.8.0
	 */
	public void addBundle(Bundle bundle)
	{
		as_component_add_bundle(asComponent, (bundle is null) ? null : bundle.getBundleStruct());
	}

	/**
	 * Add a category.
	 *
	 * Params:
	 *     category = the categories name to add.
	 */
	public void addCategory(string category)
	{
		as_component_add_category(asComponent, Str.toStringz(category));
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
	 * Add an #AsSuggested to this component.
	 *
	 * Params:
	 *     suggested = The #AsSuggested
	 */
	public void addSuggested(Suggested suggested)
	{
		as_component_add_suggested(asComponent, (suggested is null) ? null : suggested.getSuggestedStruct());
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
	 * Returns a list of #AsComponent objects which
	 * are addons extending this component in functionality.
	 *
	 * This is the reverse of %as_component_get_extends()
	 *
	 * Return: An array of #AsComponent.
	 *
	 * Since: 0.9.2
	 */
	public PtrArray getAddons()
	{
		auto p = as_component_get_addons(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Gets a bundle identifier string.
	 *
	 * Params:
	 *     bundleKind = the bundle kind, e.g. %AS_BUNDLE_KIND_LIMBA.
	 *
	 * Return: An #AsBundle, or %NULL if not set.
	 *
	 * Since: 0.8.0
	 */
	public Bundle getBundle(AsBundleKind bundleKind)
	{
		auto p = as_component_get_bundle(asComponent, bundleKind);
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Bundle)(cast(AsBundle*) p);
	}

	/**
	 * Get a list of all software bundles associated with this component.
	 *
	 * Return: A list of #AsBundle.
	 *
	 * Since: 0.10
	 */
	public PtrArray getBundles()
	{
		auto p = as_component_get_bundles(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Return: String array of categories
	 */
	public PtrArray getCategories()
	{
		auto p = as_component_get_categories(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Return: A list of desktops where this component is compulsory
	 */
	public PtrArray getCompulsoryForDesktops()
	{
		auto p = as_component_get_compulsory_for_desktops(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
	}

	/**
	 * Return: Hash table of custom user defined data fields.
	 *
	 * Since: 0.10.5
	 */
	public HashTable getCustom()
	{
		auto p = as_component_get_custom(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new HashTable(cast(GHashTable*) p);
	}

	/**
	 * Retrieve value for a custom data entry with the given key.
	 *
	 * Params:
	 *     key = Field name.
	 *
	 * Since: 0.10.5
	 */
	public string getCustomValue(string key)
	{
		return Str.toString(as_component_get_custom_value(asComponent, Str.toStringz(key)));
	}

	/**
	 * Get a unique identifier for this metadata set.
	 * This unique ID is only valid for the current session,
	 * as opposed to the AppStream ID which uniquely identifies
	 * a software component.
	 *
	 * The format of the unique id usually is:
	 * %{scope}/%{origin}/%{distribution_system}/%{appstream_id}
	 *
	 * For example:
	 * system/os/package/org.example.FooBar
	 *
	 * Return: the unique session-specific identifier.
	 */
	public string getDataId()
	{
		return Str.toString(as_component_get_data_id(asComponent));
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
	 * Get the Desktop Entry ID for this component, if it is
	 * of type "desktop-application".
	 * For most desktop-application components, this is the name
	 * of the .desktop file.
	 *
	 * Refer to https://specifications.freedesktop.org/desktop-entry-spec/latest/ape.html for more
	 * information.
	 *
	 * Return: The desktop file id.
	 *
	 * Since: 0.9.8
	 */
	public string getDesktopId()
	{
		return Str.toString(as_component_get_desktop_id(asComponent));
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
	 * Get the unique AppStream identifier for this component.
	 * This ID is unique for the described component, but does
	 * not uniquely identify the metadata set.
	 *
	 * For a unique ID for this metadata set in the current
	 * session, use %as_component_get_data_id()
	 *
	 * Return: the unique AppStream identifier.
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
	 * Get the merge method which should apply to duplicate components
	 * with this ID.
	 *
	 * Return: the #AsMergeKind of this component.
	 *
	 * Since: 0.9.8
	 */
	public AsMergeKind getMergeKind()
	{
		return as_component_get_merge_kind(asComponent);
	}

	/**
	 * The license the metadata iself is subjected to.
	 *
	 * Return: the license.
	 */
	public string getMetadataLicense()
	{
		return Str.toString(as_component_get_metadata_license(asComponent));
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
	 * Get the first package name of the list of packages that need to be installed
	 * for this component to be present on the system.
	 * Since most components consist of only one package, this is safe to use for
	 * about 90% of all cases.
	 *
	 * However, to support a component fully, please use %as_component_get_pkgnames() for
	 * getting all packages that need to be installed, and use this method only to
	 * e.g. get the main package to perform a quick "is it installed?" check.
	 *
	 * Return: String array of package names
	 */
	public string getPkgname()
	{
		return Str.toString(as_component_get_pkgname(asComponent));
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
	public PtrArray getProvided()
	{
		auto p = as_component_get_provided(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
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
	 * Returns all search tokens for this component.
	 *
	 * Return: The string search tokens
	 *
	 * Since: 0.9.7
	 */
	public PtrArray getSearchTokens()
	{
		auto p = as_component_get_search_tokens(asComponent);
		
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
	 * Get a list of associated suggestions.
	 *
	 * Return: an array of #AsSuggested instances
	 */
	public PtrArray getSuggested()
	{
		auto p = as_component_get_suggested(asComponent);
		
		if(p is null)
		{
			return null;
		}
		
		return new PtrArray(cast(GPtrArray*) p);
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
	 * Return: The #AsValueFlags that are set on @cpt.
	 */
	public AsValueFlags getValueFlags()
	{
		return as_component_get_value_flags(asComponent);
	}

	/**
	 * Return: %TRUE if this component has a bundle associated.
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
	 * Add a key and value pair to the custom data table.
	 *
	 * Params:
	 *     key = Key name.
	 *     value = A string value.
	 *
	 * Return: %TRUE if the key did not exist yet.
	 *
	 * Since: 0.10.5
	 */
	public bool insertCustomValue(string key, string value)
	{
		return as_component_insert_custom_value(asComponent, Str.toStringz(key), Str.toStringz(value)) != 0;
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
	 * Return: Whether this component's metadata should be ignored.
	 *
	 * Since: 0.10.2
	 */
	public bool isIgnored()
	{
		return as_component_is_ignored(asComponent) != 0;
	}

	/**
	 * Test if the component @cpt is a member of category @category.
	 *
	 * Params:
	 *     category = The category to test.
	 */
	public bool isMemberOfCategory(Category category)
	{
		return as_component_is_member_of_category(asComponent, (category is null) ? null : category.getCategoryStruct()) != 0;
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
	 * Searches component data for a specific keyword.
	 *
	 * Params:
	 *     term = the search term.
	 *
	 * Return: a match scrore, where 0 is no match and 100 is the best match.
	 *
	 * Since: 0.9.7
	 */
	public uint searchMatches(string term)
	{
		return as_component_search_matches(asComponent, Str.toStringz(term));
	}

	/**
	 * Searches component data for all the specific keywords.
	 *
	 * Params:
	 *     terms = the search terms.
	 *
	 * Return: a match score, where 0 is no match and larger numbers are better
	 *     matches.
	 *
	 * Since: 0.9.8
	 */
	public uint searchMatchesAll(string[] terms)
	{
		return as_component_search_matches_all(asComponent, Str.toStringzArray(terms));
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

	/**
	 * Mark this component to be compulsory for the specified desktop environment.
	 *
	 * Params:
	 *     desktop = The name of the desktop.
	 */
	public void setCompulsoryForDesktop(string desktop)
	{
		as_component_set_compulsory_for_desktop(asComponent, Str.toStringz(desktop));
	}

	/**
	 * Set the session-specific unique metadata identifier for this
	 * component.
	 * If two components have a different data_id but the same ID,
	 * they will be treated as independent sets of metadata describing
	 * the same component type.
	 *
	 * Params:
	 *     value = the unique session-specific identifier.
	 */
	public void setDataId(string value)
	{
		as_component_set_data_id(asComponent, Str.toStringz(value));
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
	 * Set the AppStream identifier for this component.
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
	 * Sets the #AsMergeKind for this component.
	 *
	 * Params:
	 *     kind = the #AsMergeKind.
	 *
	 * Since: 0.9.8
	 */
	public void setMergeKind(AsMergeKind kind)
	{
		as_component_set_merge_kind(asComponent, kind);
	}

	/**
	 * Set the license this metadata is licensed under.
	 *
	 * Params:
	 *     value = the metadata license.
	 */
	public void setMetadataLicense(string value)
	{
		as_component_set_metadata_license(asComponent, Str.toStringz(value));
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
	public void setPkgnames(string[] packages)
	{
		as_component_set_pkgnames(asComponent, Str.toStringzArray(packages));
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

	/** */
	public void setValueFlags(AsValueFlags flags)
	{
		as_component_set_value_flags(asComponent, flags);
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
