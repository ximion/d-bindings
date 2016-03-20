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


module gi.appstream;

import std.stdio;
import gi.appstreamtypes;
import gi.gobjecttypes;
import gi.giotypes;

__gshared extern(C)
{

	// appstream.Category

	GType as_category_get_type ();
	AsCategory* as_category_new ();
	void as_category_add_subcategory (AsCategory* cat, AsCategory* subcat);
	void as_category_complete (AsCategory* cat);
	const(char)* as_category_get_directory (AsCategory* cat);
	GList* as_category_get_excluded (AsCategory* cat);
	const(char)* as_category_get_icon (AsCategory* cat);
	GList* as_category_get_included (AsCategory* cat);
	int as_category_get_level (AsCategory* cat);
	const(char)* as_category_get_name (AsCategory* cat);
	GList* as_category_get_subcategories (AsCategory* cat);
	const(char)* as_category_get_summary (AsCategory* cat);
	int as_category_has_subcategory (AsCategory* cat);
	void as_category_remove_subcategory (AsCategory* cat, AsCategory* subcat);
	void as_category_set_directory (AsCategory* cat, const(char)* value);
	void as_category_set_icon (AsCategory* cat, const(char)* value);
	void as_category_set_level (AsCategory* cat, int value);
	void as_category_set_name (AsCategory* cat, const(char)* value);
	void as_category_set_summary (AsCategory* cat, const(char)* value);

	// appstream.Component

	GType as_component_get_type ();
	AsComponent* as_component_new ();
	void as_component_add_bundle_id (AsComponent* cpt, AsBundleKind bundleKind, const(char)* id);
	void as_component_add_extends (AsComponent* cpt, const(char)* cptId);
	void as_component_add_extension (AsComponent* cpt, const(char)* cptId);
	void as_component_add_icon (AsComponent* cpt, AsIcon* icon);
	void as_component_add_language (AsComponent* cpt, const(char)* locale, int percentage);
	void as_component_add_provided (AsComponent* cpt, AsProvided* prov);
	void as_component_add_release (AsComponent* cpt, AsRelease* release);
	void as_component_add_screenshot (AsComponent* cpt, AsScreenshot* sshot);
	void as_component_add_translation (AsComponent* cpt, AsTranslation* tr);
	void as_component_add_url (AsComponent* cpt, AsUrlKind urlKind, const(char)* url);
	char* as_component_get_active_locale (AsComponent* cpt);
	const(char)* as_component_get_bundle_id (AsComponent* cpt, AsBundleKind bundleKind);
	char** as_component_get_categories (AsComponent* cpt);
	char** as_component_get_compulsory_for_desktops (AsComponent* cpt);
	const(char)* as_component_get_description (AsComponent* cpt);
	const(char)* as_component_get_developer_name (AsComponent* cpt);
	GPtrArray* as_component_get_extends (AsComponent* cpt);
	GPtrArray* as_component_get_extensions (AsComponent* cpt);
	AsIcon* as_component_get_icon_by_size (AsComponent* cpt, uint width, uint height);
	GPtrArray* as_component_get_icons (AsComponent* cpt);
	const(char)* as_component_get_id (AsComponent* cpt);
	char** as_component_get_keywords (AsComponent* cpt);
	AsComponentKind as_component_get_kind (AsComponent* cpt);
	int as_component_get_language (AsComponent* cpt, const(char)* locale);
	GList* as_component_get_languages (AsComponent* cpt);
	const(char)* as_component_get_name (AsComponent* cpt);
	const(char)* as_component_get_origin (AsComponent* cpt);
	char** as_component_get_pkgnames (AsComponent* cpt);
	const(char)* as_component_get_project_group (AsComponent* cpt);
	const(char)* as_component_get_project_license (AsComponent* cpt);
	GList* as_component_get_provided (AsComponent* cpt);
	AsProvided* as_component_get_provided_for_kind (AsComponent* cpt, AsProvidedKind kind);
	GPtrArray* as_component_get_releases (AsComponent* cpt);
	GPtrArray* as_component_get_screenshots (AsComponent* cpt);
	const(char)* as_component_get_source_pkgname (AsComponent* cpt);
	const(char)* as_component_get_summary (AsComponent* cpt);
	GPtrArray* as_component_get_translations (AsComponent* cpt);
	const(char)* as_component_get_url (AsComponent* cpt, AsUrlKind urlKind);
	int as_component_has_bundle (AsComponent* cpt);
	int as_component_has_category (AsComponent* cpt, const(char)* category);
	int as_component_is_compulsory_for_desktop (AsComponent* cpt, const(char)* desktop);
	int as_component_is_valid (AsComponent* cpt);
	void as_component_set_active_locale (AsComponent* cpt, const(char)* locale);
	void as_component_set_categories (AsComponent* cpt, char** value);
	void as_component_set_compulsory_for_desktops (AsComponent* cpt, char** value);
	void as_component_set_description (AsComponent* cpt, const(char)* value, const(char)* locale);
	void as_component_set_developer_name (AsComponent* cpt, const(char)* value, const(char)* locale);
	void as_component_set_id (AsComponent* cpt, const(char)* value);
	void as_component_set_keywords (AsComponent* cpt, char** value, const(char)* locale);
	void as_component_set_kind (AsComponent* cpt, AsComponentKind value);
	void as_component_set_name (AsComponent* cpt, const(char)* value, const(char)* locale);
	void as_component_set_origin (AsComponent* cpt, const(char)* origin);
	void as_component_set_pkgnames (AsComponent* cpt, char** value);
	void as_component_set_project_group (AsComponent* cpt, const(char)* value);
	void as_component_set_project_license (AsComponent* cpt, const(char)* value);
	void as_component_set_source_pkgname (AsComponent* cpt, const(char)* spkgname);
	void as_component_set_summary (AsComponent* cpt, const(char)* value, const(char)* locale);
	char* as_component_to_string (AsComponent* cpt);

	// appstream.DataPool

	GType as_data_pool_get_type ();
	AsDataPool* as_data_pool_new ();
	GQuark as_data_pool_error_quark ();
	AsComponent* as_data_pool_get_component_by_id (AsDataPool* dpool, const(char)* id);
	GList* as_data_pool_get_components (AsDataPool* dpool);
	const(char)* as_data_pool_get_locale (AsDataPool* dpool);
	GPtrArray* as_data_pool_get_metadata_locations (AsDataPool* dpool);
	void as_data_pool_set_locale (AsDataPool* dpool, const(char)* locale);
	void as_data_pool_set_metadata_locations (AsDataPool* dpool, char** dirs);
	int as_data_pool_update (AsDataPool* dpool, GError** err);

	// appstream.Database

	GType as_database_get_type ();
	AsDatabase* as_database_new ();
	GQuark as_database_error_quark ();
	GPtrArray* as_database_find_components (AsDatabase* db, const(char)* term, const(char)* catsStr, GError** err);
	GPtrArray* as_database_get_all_components (AsDatabase* db, GError** err);
	AsComponent* as_database_get_component_by_id (AsDatabase* db, const(char)* cid, GError** err);
	GPtrArray* as_database_get_components_by_kind (AsDatabase* db, AsComponentKind kind, GError** err);
	GPtrArray* as_database_get_components_by_provided_item (AsDatabase* db, AsProvidedKind kind, const(char)* item, GError** err);
	const(char)* as_database_get_location (AsDatabase* db);
	int as_database_open (AsDatabase* db, GError** err);
	void as_database_set_location (AsDatabase* db, const(char)* dir);

	// appstream.DistroDetails

	GType as_distro_details_get_type ();
	AsDistroDetails* as_distro_details_new ();
	int as_distro_details_get_bool (AsDistroDetails* distro, const(char)* key);
	const(char)* as_distro_details_get_id (AsDistroDetails* distro);
	const(char)* as_distro_details_get_name (AsDistroDetails* distro);
	char* as_distro_details_get_str (AsDistroDetails* distro, const(char)* key);
	const(char)* as_distro_details_get_version (AsDistroDetails* distro);

	// appstream.Icon

	GType as_icon_get_type ();
	AsIcon* as_icon_new ();
	AsIconKind as_icon_kind_from_string (const(char)* kindStr);
	const(char)* as_icon_kind_to_string (AsIconKind kind);
	const(char)* as_icon_get_filename (AsIcon* icon);
	uint as_icon_get_height (AsIcon* icon);
	AsIconKind as_icon_get_kind (AsIcon* icon);
	const(char)* as_icon_get_name (AsIcon* icon);
	const(char)* as_icon_get_url (AsIcon* icon);
	uint as_icon_get_width (AsIcon* icon);
	void as_icon_set_filename (AsIcon* icon, const(char)* filename);
	void as_icon_set_height (AsIcon* icon, uint height);
	void as_icon_set_kind (AsIcon* icon, AsIconKind kind);
	void as_icon_set_name (AsIcon* icon, const(char)* name);
	void as_icon_set_url (AsIcon* icon, const(char)* url);
	void as_icon_set_width (AsIcon* icon, uint width);

	// appstream.Image

	GType as_image_get_type ();
	AsImage* as_image_new ();
	AsImageKind as_image_kind_from_string (const(char)* kind);
	const(char)* as_image_kind_to_string (AsImageKind kind);
	uint as_image_get_height (AsImage* image);
	AsImageKind as_image_get_kind (AsImage* image);
	const(char)* as_image_get_url (AsImage* image);
	uint as_image_get_width (AsImage* image);
	void as_image_set_height (AsImage* image, uint height);
	void as_image_set_kind (AsImage* image, AsImageKind kind);
	void as_image_set_url (AsImage* image, const(char)* url);
	void as_image_set_width (AsImage* image, uint width);

	// appstream.MenuParser

	GType as_menu_parser_get_type ();
	AsMenuParser* as_menu_parser_new ();
	AsMenuParser* as_menu_parser_new_from_file (const(char)* menuFile);
	int as_menu_parser_get_update_category_data (AsMenuParser* mp);
	GList* as_menu_parser_parse (AsMenuParser* mp);
	void as_menu_parser_set_update_category_data (AsMenuParser* mp, int value);

	// appstream.Metadata

	GType as_metadata_get_type ();
	AsMetadata* as_metadata_new ();
	GQuark as_metadata_error_quark ();
	void as_metadata_add_component (AsMetadata* metad, AsComponent* cpt);
	void as_metadata_clear_components (AsMetadata* metad);
	char* as_metadata_component_to_upstream_xml (AsMetadata* metad);
	char* as_metadata_components_to_distro_xml (AsMetadata* metad);
	char* as_metadata_components_to_distro_yaml (AsMetadata* metad);
	AsComponent* as_metadata_get_component (AsMetadata* metad);
	GPtrArray* as_metadata_get_components (AsMetadata* metad);
	const(char)* as_metadata_get_locale (AsMetadata* metad);
	const(char)* as_metadata_get_origin (AsMetadata* metad);
	AsParserMode as_metadata_get_parser_mode (AsMetadata* metad);
	int as_metadata_get_update_existing (AsMetadata* metad);
	int as_metadata_get_write_header (AsMetadata* metad);
	void as_metadata_parse_file (AsMetadata* metad, GFile* file, GError** err);
	void as_metadata_parse_xml (AsMetadata* metad, const(char)* data, GError** err);
	void as_metadata_parse_yaml (AsMetadata* metad, const(char)* data, GError** err);
	void as_metadata_save_distro_xml (AsMetadata* metad, const(char)* fname, GError** err);
	void as_metadata_save_distro_yaml (AsMetadata* metad, const(char)* fname, GError** err);
	void as_metadata_save_upstream_xml (AsMetadata* metad, const(char)* fname, GError** err);
	void as_metadata_set_locale (AsMetadata* metad, const(char)* locale);
	void as_metadata_set_origin (AsMetadata* metad, const(char)* origin);
	void as_metadata_set_parser_mode (AsMetadata* metad, AsParserMode mode);
	void as_metadata_set_update_existing (AsMetadata* metad, int update);
	void as_metadata_set_write_header (AsMetadata* metad, int wheader);

	// appstream.Provided

	GType as_provided_get_type ();
	AsProvided* as_provided_new ();
	AsProvidedKind as_provided_kind_from_string (const(char)* kindStr);
	const(char)* as_provided_kind_to_l10n_string (AsProvidedKind kind);
	const(char)* as_provided_kind_to_string (AsProvidedKind kind);
	void as_provided_add_item (AsProvided* prov, const(char)* item);
	char** as_provided_get_items (AsProvided* prov);
	AsProvidedKind as_provided_get_kind (AsProvided* prov);
	int as_provided_has_item (AsProvided* prov, const(char)* item);
	void as_provided_set_kind (AsProvided* prov, AsProvidedKind kind);

	// appstream.Release

	GType as_release_get_type ();
	AsRelease* as_release_new ();
	void as_release_add_location (AsRelease* release, const(char)* location);
	char* as_release_get_active_locale (AsRelease* release);
	const(char)* as_release_get_checksum (AsRelease* release, AsChecksumKind kind);
	const(char)* as_release_get_description (AsRelease* release);
	GPtrArray* as_release_get_locations (AsRelease* release);
	ulong as_release_get_size (AsRelease* release, AsSizeKind kind);
	ulong as_release_get_timestamp (AsRelease* release);
	AsUrgencyKind as_release_get_urgency (AsRelease* release);
	const(char)* as_release_get_version (AsRelease* release);
	void as_release_set_active_locale (AsRelease* release, const(char)* locale);
	void as_release_set_checksum (AsRelease* release, const(char)* checksum, AsChecksumKind kind);
	void as_release_set_description (AsRelease* release, const(char)* description, const(char)* locale);
	void as_release_set_size (AsRelease* release, ulong size, AsSizeKind kind);
	void as_release_set_timestamp (AsRelease* release, ulong timestamp);
	void as_release_set_urgency (AsRelease* release, AsUrgencyKind urgency);
	void as_release_set_version (AsRelease* release, const(char)* versio);

	// appstream.Screenshot

	GType as_screenshot_get_type ();
	AsScreenshot* as_screenshot_new ();
	AsScreenshotKind as_screenshot_kind_from_string (const(char)* kind);
	const(char)* as_screenshot_kind_to_string (AsScreenshotKind kind);
	void as_screenshot_add_image (AsScreenshot* screenshot, AsImage* image);
	char* as_screenshot_get_active_locale (AsScreenshot* screenshot);
	const(char)* as_screenshot_get_caption (AsScreenshot* screenshot);
	GPtrArray* as_screenshot_get_images (AsScreenshot* screenshot);
	AsScreenshotKind as_screenshot_get_kind (AsScreenshot* screenshot);
	int as_screenshot_is_valid (AsScreenshot* screenshot);
	void as_screenshot_set_active_locale (AsScreenshot* screenshot, const(char)* locale);
	void as_screenshot_set_caption (AsScreenshot* screenshot, const(char)* caption, const(char)* locale);
	void as_screenshot_set_kind (AsScreenshot* screenshot, AsScreenshotKind kind);

	// appstream.Translation

	GType as_translation_get_type ();
	AsTranslation* as_translation_new ();
	AsTranslationKind as_translation_kind_from_string (const(char)* kindStr);
	const(char)* as_translation_kind_to_string (AsTranslationKind kind);
	const(char)* as_translation_get_id (AsTranslation* tr);
	AsTranslationKind as_translation_get_kind (AsTranslation* tr);
	void as_translation_set_id (AsTranslation* tr, const(char)* id);
	void as_translation_set_kind (AsTranslation* tr, AsTranslationKind kind);

	// appstream.Validator

	GType as_validator_get_type ();
	AsValidator* as_validator_new ();
	void as_validator_clear_issues (AsValidator* validator);
	GList* as_validator_get_issues (AsValidator* validator);
	int as_validator_validate_data (AsValidator* validator, const(char)* metadata);
	int as_validator_validate_file (AsValidator* validator, GFile* metadataFile);
	int as_validator_validate_tree (AsValidator* validator, const(char)* rootDir);

	// appstream.ValidatorIssue

	GType as_validator_issue_get_type ();
	AsValidatorIssue* as_validator_issue_new ();
	AsIssueImportance as_validator_issue_get_importance (AsValidatorIssue* issue);
	AsIssueKind as_validator_issue_get_kind (AsValidatorIssue* issue);
	const(char)* as_validator_issue_get_location (AsValidatorIssue* issue);
	const(char)* as_validator_issue_get_message (AsValidatorIssue* issue);
	void as_validator_issue_set_importance (AsValidatorIssue* issue, AsIssueImportance importance);
	void as_validator_issue_set_kind (AsValidatorIssue* issue, AsIssueKind kind);
	void as_validator_issue_set_location (AsValidatorIssue* issue, const(char)* location);
	void as_validator_issue_set_message (AsValidatorIssue* issue, const(char)* message);
}
