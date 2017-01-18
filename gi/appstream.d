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


module gi.appstream;

import std.stdio;
import gi.appstreamtypes;
import gi.gobjecttypes;
import gi.giotypes;


__gshared extern(C)
{

	// appstream.Bundle

	GType as_bundle_get_type ();
	AsBundle* as_bundle_new ();
	AsBundleKind as_bundle_kind_from_string (const(char)* bundleStr);
	const(char)* as_bundle_kind_to_string (AsBundleKind kind);
	const(char)* as_bundle_get_id (AsBundle* bundle);
	AsBundleKind as_bundle_get_kind (AsBundle* bundle);
	void as_bundle_set_id (AsBundle* bundle, const(char)* id);
	void as_bundle_set_kind (AsBundle* bundle, AsBundleKind kind);

	// appstream.Category

	GType as_category_get_type ();
	AsCategory* as_category_new ();
	void as_category_add_child (AsCategory* category, AsCategory* subcat);
	void as_category_add_component (AsCategory* category, AsComponent* cpt);
	void as_category_add_desktop_group (AsCategory* category, const(char)* groupName);
	GPtrArray* as_category_get_children (AsCategory* category);
	GPtrArray* as_category_get_components (AsCategory* category);
	GPtrArray* as_category_get_desktop_groups (AsCategory* category);
	const(char)* as_category_get_icon (AsCategory* category);
	const(char)* as_category_get_id (AsCategory* category);
	const(char)* as_category_get_name (AsCategory* category);
	const(char)* as_category_get_summary (AsCategory* category);
	int as_category_has_children (AsCategory* category);
	int as_category_has_component (AsCategory* category, AsComponent* cpt);
	void as_category_remove_child (AsCategory* category, AsCategory* subcat);
	void as_category_set_icon (AsCategory* category, const(char)* value);
	void as_category_set_id (AsCategory* category, const(char)* id);
	void as_category_set_name (AsCategory* category, const(char)* value);
	void as_category_set_summary (AsCategory* category, const(char)* value);

	// appstream.Checksum

	GType as_checksum_get_type ();
	AsChecksum* as_checksum_new ();
	AsChecksumKind as_checksum_kind_from_string (const(char)* kindStr);
	const(char)* as_checksum_kind_to_string (AsChecksumKind kind);
	AsChecksumKind as_checksum_get_kind (AsChecksum* cs);
	const(char)* as_checksum_get_value (AsChecksum* cs);
	void as_checksum_set_kind (AsChecksum* cs, AsChecksumKind kind);
	void as_checksum_set_value (AsChecksum* cs, const(char)* value);

	// appstream.Component

	GType as_component_get_type ();
	AsComponent* as_component_new ();
	void as_component_add_addon (AsComponent* cpt, AsComponent* addon);
	void as_component_add_bundle (AsComponent* cpt, AsBundle* bundle);
	void as_component_add_category (AsComponent* cpt, const(char)* category);
	void as_component_add_extends (AsComponent* cpt, const(char)* cptId);
	void as_component_add_icon (AsComponent* cpt, AsIcon* icon);
	void as_component_add_language (AsComponent* cpt, const(char)* locale, int percentage);
	void as_component_add_provided (AsComponent* cpt, AsProvided* prov);
	void as_component_add_release (AsComponent* cpt, AsRelease* release);
	void as_component_add_screenshot (AsComponent* cpt, AsScreenshot* sshot);
	void as_component_add_suggested (AsComponent* cpt, AsSuggested* suggested);
	void as_component_add_translation (AsComponent* cpt, AsTranslation* tr);
	void as_component_add_url (AsComponent* cpt, AsUrlKind urlKind, const(char)* url);
	char* as_component_get_active_locale (AsComponent* cpt);
	GPtrArray* as_component_get_addons (AsComponent* cpt);
	AsBundle* as_component_get_bundle (AsComponent* cpt, AsBundleKind bundleKind);
	GPtrArray* as_component_get_bundles (AsComponent* cpt);
	GPtrArray* as_component_get_categories (AsComponent* cpt);
	GPtrArray* as_component_get_compulsory_for_desktops (AsComponent* cpt);
	GHashTable* as_component_get_custom (AsComponent* cpt);
	char* as_component_get_custom_value (AsComponent* cpt, const(char)* key);
	const(char)* as_component_get_data_id (AsComponent* cpt);
	const(char)* as_component_get_description (AsComponent* cpt);
	const(char)* as_component_get_desktop_id (AsComponent* cpt);
	const(char)* as_component_get_developer_name (AsComponent* cpt);
	GPtrArray* as_component_get_extends (AsComponent* cpt);
	AsIcon* as_component_get_icon_by_size (AsComponent* cpt, uint width, uint height);
	GPtrArray* as_component_get_icons (AsComponent* cpt);
	const(char)* as_component_get_id (AsComponent* cpt);
	char** as_component_get_keywords (AsComponent* cpt);
	AsComponentKind as_component_get_kind (AsComponent* cpt);
	int as_component_get_language (AsComponent* cpt, const(char)* locale);
	GList* as_component_get_languages (AsComponent* cpt);
	AsMergeKind as_component_get_merge_kind (AsComponent* cpt);
	const(char)* as_component_get_metadata_license (AsComponent* cpt);
	const(char)* as_component_get_name (AsComponent* cpt);
	const(char)* as_component_get_origin (AsComponent* cpt);
	char* as_component_get_pkgname (AsComponent* cpt);
	char** as_component_get_pkgnames (AsComponent* cpt);
	const(char)* as_component_get_project_group (AsComponent* cpt);
	const(char)* as_component_get_project_license (AsComponent* cpt);
	GPtrArray* as_component_get_provided (AsComponent* cpt);
	AsProvided* as_component_get_provided_for_kind (AsComponent* cpt, AsProvidedKind kind);
	GPtrArray* as_component_get_releases (AsComponent* cpt);
	GPtrArray* as_component_get_screenshots (AsComponent* cpt);
	GPtrArray* as_component_get_search_tokens (AsComponent* cpt);
	const(char)* as_component_get_source_pkgname (AsComponent* cpt);
	GPtrArray* as_component_get_suggested (AsComponent* cpt);
	const(char)* as_component_get_summary (AsComponent* cpt);
	GPtrArray* as_component_get_translations (AsComponent* cpt);
	const(char)* as_component_get_url (AsComponent* cpt, AsUrlKind urlKind);
	AsValueFlags as_component_get_value_flags (AsComponent* cpt);
	int as_component_has_bundle (AsComponent* cpt);
	int as_component_has_category (AsComponent* cpt, const(char)* category);
	int as_component_insert_custom_value (AsComponent* cpt, const(char)* key, const(char)* value);
	int as_component_is_compulsory_for_desktop (AsComponent* cpt, const(char)* desktop);
	int as_component_is_ignored (AsComponent* cpt);
	int as_component_is_member_of_category (AsComponent* cpt, AsCategory* category);
	int as_component_is_valid (AsComponent* cpt);
	uint as_component_search_matches (AsComponent* cpt, const(char)* term);
	uint as_component_search_matches_all (AsComponent* cpt, char** terms);
	void as_component_set_active_locale (AsComponent* cpt, const(char)* locale);
	void as_component_set_compulsory_for_desktop (AsComponent* cpt, const(char)* desktop);
	void as_component_set_data_id (AsComponent* cpt, const(char)* value);
	void as_component_set_description (AsComponent* cpt, const(char)* value, const(char)* locale);
	void as_component_set_developer_name (AsComponent* cpt, const(char)* value, const(char)* locale);
	void as_component_set_id (AsComponent* cpt, const(char)* value);
	void as_component_set_keywords (AsComponent* cpt, char** value, const(char)* locale);
	void as_component_set_kind (AsComponent* cpt, AsComponentKind value);
	void as_component_set_merge_kind (AsComponent* cpt, AsMergeKind kind);
	void as_component_set_metadata_license (AsComponent* cpt, const(char)* value);
	void as_component_set_name (AsComponent* cpt, const(char)* value, const(char)* locale);
	void as_component_set_origin (AsComponent* cpt, const(char)* origin);
	void as_component_set_pkgnames (AsComponent* cpt, char** packages);
	void as_component_set_project_group (AsComponent* cpt, const(char)* value);
	void as_component_set_project_license (AsComponent* cpt, const(char)* value);
	void as_component_set_source_pkgname (AsComponent* cpt, const(char)* spkgname);
	void as_component_set_summary (AsComponent* cpt, const(char)* value, const(char)* locale);
	void as_component_set_value_flags (AsComponent* cpt, AsValueFlags flags);
	char* as_component_to_string (AsComponent* cpt);

	// appstream.DistroDetails

	GType as_distro_details_get_type ();
	AsDistroDetails* as_distro_details_new ();
	int as_distro_details_get_bool (AsDistroDetails* distro, const(char)* key, int defaultVal);
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
	const(char)* as_image_get_locale (AsImage* image);
	const(char)* as_image_get_url (AsImage* image);
	uint as_image_get_width (AsImage* image);
	void as_image_set_height (AsImage* image, uint height);
	void as_image_set_kind (AsImage* image, AsImageKind kind);
	void as_image_set_locale (AsImage* image, const(char)* locale);
	void as_image_set_url (AsImage* image, const(char)* url);
	void as_image_set_width (AsImage* image, uint width);

	// appstream.Metadata

	GType as_metadata_get_type ();
	AsMetadata* as_metadata_new ();
	GQuark as_metadata_error_quark ();
	void as_metadata_add_component (AsMetadata* metad, AsComponent* cpt);
	void as_metadata_clear_components (AsMetadata* metad);
	char* as_metadata_component_to_metainfo (AsMetadata* metad, AsFormatKind format, GError** err);
	char* as_metadata_components_to_collection (AsMetadata* metad, AsFormatKind format, GError** err);
	const(char)* as_metadata_get_architecture (AsMetadata* metad);
	AsComponent* as_metadata_get_component (AsMetadata* metad);
	GPtrArray* as_metadata_get_components (AsMetadata* metad);
	AsFormatStyle as_metadata_get_format_style (AsMetadata* metad);
	AsFormatVersion as_metadata_get_format_version (AsMetadata* metad);
	const(char)* as_metadata_get_locale (AsMetadata* metad);
	const(char)* as_metadata_get_origin (AsMetadata* metad);
	int as_metadata_get_update_existing (AsMetadata* metad);
	int as_metadata_get_write_header (AsMetadata* metad);
	void as_metadata_parse (AsMetadata* metad, const(char)* data, AsFormatKind format, GError** err);
	void as_metadata_parse_desktop_data (AsMetadata* metad, const(char)* data, const(char)* cid, GError** err);
	void as_metadata_parse_file (AsMetadata* metad, GFile* file, AsFormatKind format, GError** err);
	void as_metadata_save_collection (AsMetadata* metad, const(char)* fname, AsFormatKind format, GError** err);
	void as_metadata_save_metainfo (AsMetadata* metad, const(char)* fname, AsFormatKind format, GError** err);
	void as_metadata_set_architecture (AsMetadata* metad, const(char)* arch);
	void as_metadata_set_format_style (AsMetadata* metad, AsFormatStyle mode);
	void as_metadata_set_format_version (AsMetadata* metad, AsFormatVersion versio);
	void as_metadata_set_locale (AsMetadata* metad, const(char)* locale);
	void as_metadata_set_origin (AsMetadata* metad, const(char)* origin);
	void as_metadata_set_update_existing (AsMetadata* metad, int update);
	void as_metadata_set_write_header (AsMetadata* metad, int wheader);

	// appstream.Pool

	GType as_pool_get_type ();
	AsPool* as_pool_new ();
	GQuark as_pool_error_quark ();
	int as_pool_add_component (AsPool* pool, AsComponent* cpt, GError** err);
	void as_pool_add_metadata_location (AsPool* pool, const(char)* directory);
	void as_pool_clear (AsPool* pool);
	void as_pool_clear_metadata_locations (AsPool* pool);
	AsCacheFlags as_pool_get_cache_flags (AsPool* pool);
	GPtrArray* as_pool_get_components (AsPool* pool);
	GPtrArray* as_pool_get_components_by_categories (AsPool* pool, char** categories);
	GPtrArray* as_pool_get_components_by_id (AsPool* pool, const(char)* cid);
	GPtrArray* as_pool_get_components_by_kind (AsPool* pool, AsComponentKind kind);
	GPtrArray* as_pool_get_components_by_provided_item (AsPool* pool, AsProvidedKind kind, const(char)* item);
	AsPoolFlags as_pool_get_flags (AsPool* pool);
	const(char)* as_pool_get_locale (AsPool* pool);
	int as_pool_load (AsPool* pool, GCancellable* cancellable, GError** err);
	int as_pool_load_cache_file (AsPool* pool, const(char)* fname, GError** err);
	int as_pool_refresh_cache (AsPool* pool, int force, GError** err);
	int as_pool_save_cache_file (AsPool* pool, const(char)* fname, GError** err);
	GPtrArray* as_pool_search (AsPool* pool, const(char)* search);
	void as_pool_set_cache_flags (AsPool* pool, AsCacheFlags flags);
	void as_pool_set_flags (AsPool* pool, AsPoolFlags flags);
	void as_pool_set_locale (AsPool* pool, const(char)* locale);

	// appstream.Provided

	GType as_provided_get_type ();
	AsProvided* as_provided_new ();
	AsProvidedKind as_provided_kind_from_string (const(char)* kindStr);
	const(char)* as_provided_kind_to_l10n_string (AsProvidedKind kind);
	const(char)* as_provided_kind_to_string (AsProvidedKind kind);
	void as_provided_add_item (AsProvided* prov, const(char)* item);
	GPtrArray* as_provided_get_items (AsProvided* prov);
	AsProvidedKind as_provided_get_kind (AsProvided* prov);
	int as_provided_has_item (AsProvided* prov, const(char)* item);
	void as_provided_set_kind (AsProvided* prov, AsProvidedKind kind);

	// appstream.Release

	GType as_release_get_type ();
	AsRelease* as_release_new ();
	void as_release_add_checksum (AsRelease* release, AsChecksum* cs);
	void as_release_add_location (AsRelease* release, const(char)* location);
	char* as_release_get_active_locale (AsRelease* release);
	AsChecksum* as_release_get_checksum (AsRelease* release, AsChecksumKind kind);
	GPtrArray* as_release_get_checksums (AsRelease* release);
	const(char)* as_release_get_description (AsRelease* release);
	GPtrArray* as_release_get_locations (AsRelease* release);
	ulong as_release_get_size (AsRelease* release, AsSizeKind kind);
	ulong as_release_get_timestamp (AsRelease* release);
	AsUrgencyKind as_release_get_urgency (AsRelease* release);
	const(char)* as_release_get_version (AsRelease* release);
	void as_release_set_active_locale (AsRelease* release, const(char)* locale);
	void as_release_set_description (AsRelease* release, const(char)* description, const(char)* locale);
	void as_release_set_size (AsRelease* release, ulong size, AsSizeKind kind);
	void as_release_set_timestamp (AsRelease* release, ulong timestamp);
	void as_release_set_urgency (AsRelease* release, AsUrgencyKind urgency);
	void as_release_set_version (AsRelease* release, const(char)* versio);
	int as_release_vercmp (AsRelease* rel1, AsRelease* rel2);

	// appstream.Screenshot

	GType as_screenshot_get_type ();
	AsScreenshot* as_screenshot_new ();
	AsScreenshotKind as_screenshot_kind_from_string (const(char)* kind);
	const(char)* as_screenshot_kind_to_string (AsScreenshotKind kind);
	void as_screenshot_add_image (AsScreenshot* screenshot, AsImage* image);
	char* as_screenshot_get_active_locale (AsScreenshot* screenshot);
	const(char)* as_screenshot_get_caption (AsScreenshot* screenshot);
	GPtrArray* as_screenshot_get_images (AsScreenshot* screenshot);
	GPtrArray* as_screenshot_get_images_all (AsScreenshot* screenshot);
	AsScreenshotKind as_screenshot_get_kind (AsScreenshot* screenshot);
	int as_screenshot_is_valid (AsScreenshot* screenshot);
	void as_screenshot_set_active_locale (AsScreenshot* screenshot, const(char)* locale);
	void as_screenshot_set_caption (AsScreenshot* screenshot, const(char)* caption, const(char)* locale);
	void as_screenshot_set_kind (AsScreenshot* screenshot, AsScreenshotKind kind);

	// appstream.Suggested

	GType as_suggested_get_type ();
	AsSuggested* as_suggested_new ();
	AsSuggestedKind as_suggested_kind_from_string (const(char)* kindStr);
	const(char)* as_suggested_kind_to_string (AsSuggestedKind kind);
	void as_suggested_add_id (AsSuggested* suggested, const(char)* cid);
	GPtrArray* as_suggested_get_ids (AsSuggested* suggested);
	AsSuggestedKind as_suggested_get_kind (AsSuggested* suggested);
	int as_suggested_is_valid (AsSuggested* suggested);
	void as_suggested_set_kind (AsSuggested* suggested, AsSuggestedKind kind);

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
	const(char)* as_validator_issue_get_cid (AsValidatorIssue* issue);
	const(char)* as_validator_issue_get_filename (AsValidatorIssue* issue);
	AsIssueImportance as_validator_issue_get_importance (AsValidatorIssue* issue);
	AsIssueKind as_validator_issue_get_kind (AsValidatorIssue* issue);
	int as_validator_issue_get_line (AsValidatorIssue* issue);
	char* as_validator_issue_get_location (AsValidatorIssue* issue);
	const(char)* as_validator_issue_get_message (AsValidatorIssue* issue);
	void as_validator_issue_set_cid (AsValidatorIssue* issue, const(char)* cid);
	void as_validator_issue_set_filename (AsValidatorIssue* issue, const(char)* fname);
	void as_validator_issue_set_importance (AsValidatorIssue* issue, AsIssueImportance importance);
	void as_validator_issue_set_kind (AsValidatorIssue* issue, AsIssueKind kind);
	void as_validator_issue_set_line (AsValidatorIssue* issue, int line);
	void as_validator_issue_set_message (AsValidatorIssue* issue, const(char)* message);
}

