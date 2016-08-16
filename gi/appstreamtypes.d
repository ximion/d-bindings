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


module gi.appstreamtypes;

import gi.glibtypes;
import gi.gobjecttypes;
import gi.giotypes;

/**
 * The bundle type.
 */
public enum AsBundleKind
{
	/**
	 * Type invalid or not known
	 */
	UNKNOWN = 0,
	/**
	 * A Limba bundle
	 */
	LIMBA = 1,
	/**
	 * A Flatpak bundle
	 */
	FLATPAK = 2,
}
alias AsBundleKind BundleKind;

/**
 * Flags on how caching should be used.
 */
public enum AsCacheFlags
{
	/**
	 * Type invalid or not known
	 */
	NONE = 0,
	/**
	 * Create an user-specific metadata cache.
	 */
	USE_USER = 1,
	/**
	 * Use and - if possible - update the global metadata cache.
	 */
	USE_SYSTEM = 2,
}
alias AsCacheFlags CacheFlags;

/**
 * Checksums supported by #AsRelease
 */
public enum AsChecksumKind
{
	/**
	 * No checksum
	 */
	NONE = 0,
	/**
	 * SHA1
	 */
	SHA1 = 1,
	/**
	 * SHA256
	 */
	SHA256 = 2,
}
alias AsChecksumKind ChecksumKind;

/**
 * The type of an #AsComponent.
 */
public enum AsComponentKind
{
	/**
	 * Type invalid or not known
	 */
	UNKNOWN = 0,
	/**
	 * A generic (= without specialized type) component
	 */
	GENERIC = 1,
	/**
	 * An application with a .desktop-file
	 */
	DESKTOP_APP = 2,
	/**
	 * A console application
	 */
	CONSOLE_APP = 3,
	/**
	 * A web application
	 */
	WEB_APP = 4,
	/**
	 * An extension of existing software, which does not run standalone
	 */
	ADDON = 5,
	/**
	 * A font
	 */
	FONT = 6,
	/**
	 * A multimedia codec
	 */
	CODEC = 7,
	/**
	 * An input-method provider
	 */
	INPUTMETHOD = 8,
	/**
	 * Firmware
	 */
	FIRMWARE = 9,
	LAST = 10,
}
alias AsComponentKind ComponentKind;

/**
 * The icon type.
 */
public enum AsIconKind
{
	/**
	 * Unknown icon kind
	 */
	UNKNOWN = 0,
	/**
	 * Icon in the internal caches
	 */
	CACHED = 1,
	/**
	 * Stock icon name
	 */
	STOCK = 2,
	/**
	 * Local icon name
	 */
	LOCAL = 3,
	/**
	 * Remote icon URL
	 */
	REMOTE = 4,
}
alias AsIconKind IconKind;

/**
 * The image type.
 */
public enum AsImageKind
{
	/**
	 * Type invalid or not known
	 */
	UNKNOWN = 0,
	/**
	 * The source image at full resolution
	 */
	SOURCE = 1,
	/**
	 * A thumbnail at reduced resolution
	 */
	THUMBNAIL = 2,
}
alias AsImageKind ImageKind;

/**
 * The importance of an issue found by #AsValidator
 */
public enum AsIssueImportance
{
	UNKNOWN = 0,
	/**
	 * There is a serious error in your metadata
	 */
	ERROR = 1,
	/**
	 * Something which should be fixed, but is not fatal
	 */
	WARNING = 2,
	/**
	 * Non-essential information on how to improve your metadata
	 */
	INFO = 3,
	/**
	 * Pedantic information
	 */
	PEDANTIC = 4,
}
alias AsIssueImportance IssueImportance;

/**
 * The issue type.
 */
public enum AsIssueKind
{
	/**
	 * Type invalid or not known
	 */
	UNKNOWN = 0,
	/**
	 * The XML markup is invalid
	 */
	MARKUP_INVALID = 1,
	/**
	 * An element from a legacy AppStream specification has been found
	 */
	LEGACY = 2,
	/**
	 * A tag is duplicated
	 */
	TAG_DUPLICATED = 3,
	/**
	 * A required tag is missing
	 */
	TAG_MISSING = 4,
	/**
	 * An unknown tag was found
	 */
	TAG_UNKNOWN = 5,
	/**
	 * A tag is not allowed in the current context
	 */
	TAG_NOT_ALLOWED = 6,
	/**
	 * A required property is missing
	 */
	PROPERTY_MISSING = 7,
	/**
	 * A property is invalid
	 */
	PROPERTY_INVALID = 8,
	/**
	 * A value is missing
	 */
	VALUE_MISSING = 9,
	/**
	 * The value of a tag or property is wrong
	 */
	VALUE_WRONG = 10,
	/**
	 * There is an issue with a tag or property value (often non-fatal)
	 */
	VALUE_ISSUE = 11,
	/**
	 * A required file or other metadata was missing
	 */
	FILE_MISSING = 12,
	/**
	 * The naming of an entity is wrong
	 */
	WRONG_NAME = 13,
	/**
	 * Reading of data failed
	 */
	READ_ERROR = 14,
}
alias AsIssueKind IssueKind;

/**
 * Defines how #AsComponent data should be merged if the component is
 * set for merge.
 */
public enum AsMergeKind
{
	/**
	 * No merge is happening.
	 */
	NONE = 0,
	/**
	 * Merge replacing data of target.
	 */
	REPLACE = 1,
	/**
	 * Merge appending data to target.
	 */
	APPEND = 2,
}
alias AsMergeKind MergeKind;

/**
 * A metadata processing error.
 */
public enum AsMetadataError
{
	/**
	 * Generic failure.
	 */
	FAILED = 0,
	/**
	 * Unable to parse the metadata file.
	 */
	PARSE = 1,
	/**
	 * Expected upstream metadata but got distro metadata, or vice versa.
	 */
	UNEXPECTED_FORMAT_KIND = 2,
	/**
	 * We expected a component in the pool, but couldn't find one.
	 */
	NO_COMPONENT = 3,
}
alias AsMetadataError MetadataError;

/**
 * There are a few differences between Appstream's upstream metadata
 * and the distribution metadata.
 * The parser mode indicates which style we should process.
 * Usually you don't want to change this.
 */
public enum AsParserMode
{
	/**
	 * Parse Appstream upstream metadata
	 */
	UPSTREAM = 0,
	/**
	 * Parse Appstream distribution metadata
	 */
	DISTRO = 1,
}
alias AsParserMode ParserMode;

/**
 * A metadata pool error.
 */
public enum AsPoolError
{
	/**
	 * Generic failure
	 */
	FAILED = 0,
	/**
	 * We do not have write-access to the cache target location.
	 */
	TARGET_NOT_WRITABLE = 1,
	/**
	 * The pool was loaded, but we had to ignore some metadata.
	 */
	INCOMPLETE = 2,
	/**
	 * An AppStream-ID collision occured (a component with that ID already existed in the pool)
	 */
	COLLISION = 3,
	/**
	 * A search or selection term was invalid.
	 */
	TERM_INVALID = 4,
}
alias AsPoolError PoolError;

/**
 * Type of the public interface components can provide.
 */
public enum AsProvidedKind
{
	/**
	 * Unknown kind
	 */
	UNKNOWN = 0,
	/**
	 * A shared library
	 */
	LIBRARY = 1,
	/**
	 * A binary installed into a directory in PATH
	 */
	BINARY = 2,
	/**
	 * Provides a handler for a mimetype
	 */
	MIMETYPE = 3,
	/**
	 * A font
	 */
	FONT = 4,
	/**
	 * A modalias
	 */
	MODALIAS = 5,
	/**
	 * A Python2 module
	 */
	PYTHON_2 = 6,
	/**
	 * A Python3 module
	 */
	PYTHON = 7,
	/**
	 * A DBus service name on the system bus.
	 */
	DBUS_SYSTEM = 8,
	/**
	 * A DBus service name on the user/session bus.
	 */
	DBUS_USER = 9,
	/**
	 * Firmware flashed at runtime.
	 */
	FIRMWARE_RUNTIME = 10,
	/**
	 * Firmware flashed permanently to the device.
	 */
	FIRMWARE_FLASHED = 11,
}
alias AsProvidedKind ProvidedKind;

/**
 * The screenshot type.
 */
public enum AsScreenshotKind
{
	/**
	 * Type invalid or not known
	 */
	UNKNOWN = 0,
	/**
	 * The primary screenshot to show by default
	 */
	DEFAULT = 1,
	/**
	 * Optional screenshot
	 */
	EXTRA = 2,
}
alias AsScreenshotKind ScreenshotKind;

/**
 * The release size kind.
 *
 * Since: 0.8.6
 */
public enum AsSizeKind
{
	/**
	 * Unknown size
	 */
	UNKNOWN = 0,
	/**
	 * Size of download of component
	 */
	DOWNLOAD = 1,
	/**
	 * Size of installed component
	 */
	INSTALLED = 2,
}
alias AsSizeKind SizeKind;

/**
 * The suggested type.
 */
public enum AsSuggestedKind
{
	/**
	 * Unknown suggested kind
	 */
	UNKNOWN = 0,
	/**
	 * Suggestions provided by the upstream project.
	 */
	UPSTREAM = 1,
	/**
	 * Suggestions provided by automatic heuristics.
	 */
	HEURISTIC = 2,
}
alias AsSuggestedKind SuggestedKind;

/**
 * The translation type.
 */
public enum AsTranslationKind
{
	/**
	 * Type invalid or not known
	 */
	UNKNOWN = 0,
	/**
	 * Gettext translation domain
	 */
	GETTEXT = 1,
	/**
	 * Qt translation domain
	 */
	QT = 2,
}
alias AsTranslationKind TranslationKind;

/**
 * The urgency of an #AsRelease
 */
public enum AsUrgencyKind
{
	/**
	 * Urgency is unknown or not set
	 */
	UNKNOWN = 0,
	/**
	 * Low urgency
	 */
	LOW = 1,
	/**
	 * Medium urgency
	 */
	MEDIUM = 2,
	/**
	 * High urgency
	 */
	HIGH = 3,
	/**
	 * Critical urgency
	 */
	CRITICAL = 4,
}
alias AsUrgencyKind UrgencyKind;

/**
 * The URL type.
 */
public enum AsUrlKind
{
	/**
	 * Type invalid or not known
	 */
	UNKNOWN = 0,
	/**
	 * Project homepage
	 */
	HOMEPAGE = 1,
	/**
	 * Bugtracker
	 */
	BUGTRACKER = 2,
	/**
	 * FAQ page
	 */
	FAQ = 3,
	/**
	 * Help manual
	 */
	HELP = 4,
	/**
	 * Page with information about how to donate to the project
	 */
	DONATION = 5,
	/**
	 * Page with instructions on how to translate the project / submit translations.
	 */
	TRANSLATE = 6,
}
alias AsUrlKind UrlKind;

/**
 * Set how values assigned to an #AsComponent should be treated when
 * they are set or retrieved.
 */
public enum AsValueFlags
{
	/**
	 * No flags.
	 */
	NONE = 0,
	/**
	 * Don't fall back to C when retrieving translated values.
	 */
	NO_TRANSLATION_FALLBACK = 1,
}
alias AsValueFlags ValueFlags;

struct AsCategory
{
	GObject parentInstance;
}

struct AsCategoryClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsComponent
{
	GObject parentInstance;
}

struct AsComponentClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsDistroDetails
{
	GObject parentInstance;
}

struct AsDistroDetailsClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsIcon
{
	GObject parentInstance;
}

struct AsIconClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsImage
{
	GObject parentInstance;
}

struct AsImageClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsMenuParser
{
	GObject parentInstance;
}

struct AsMenuParserClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsMetadata
{
	GObject parentInstance;
}

struct AsMetadataClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsPool
{
	GObject parentInstance;
}

struct AsPoolClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsProvided
{
	GObject parentInstance;
}

struct AsProvidedClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsRelease
{
	GObject parentInstance;
}

struct AsReleaseClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsScreenshot
{
	GObject parentInstance;
}

struct AsScreenshotClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsSuggested
{
	GObject parentInstance;
}

struct AsSuggestedClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsTranslation
{
	GObject parentInstance;
}

struct AsTranslationClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsValidator
{
	GObject parentInstance;
}

struct AsValidatorClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}

struct AsValidatorIssue
{
	GObject parentInstance;
}

struct AsValidatorIssueClass
{
	GObjectClass parentClass;
	/** */
	extern(C) void function() AsReserved1;
	/** */
	extern(C) void function() AsReserved2;
	/** */
	extern(C) void function() AsReserved3;
	/** */
	extern(C) void function() AsReserved4;
	/** */
	extern(C) void function() AsReserved5;
	/** */
	extern(C) void function() AsReserved6;
}
