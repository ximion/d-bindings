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


module gio.VolumeT;

public  import gi.gio;
public  import gi.giotypes;
public  import gio.AsyncResultIF;
public  import gio.Cancellable;
public  import gio.Drive;
public  import gio.DriveIF;
public  import gio.File;
public  import gio.FileIF;
public  import gio.Icon;
public  import gio.IconIF;
public  import gio.Mount;
public  import gio.MountIF;
public  import gio.MountOperation;
public  import glib.ErrorG;
public  import glib.GException;
public  import glib.Str;
public  import gobject.ObjectG;
public  import gobject.Signals;


/**
 * The #GVolume interface represents user-visible objects that can be
 * mounted. Note, when porting from GnomeVFS, #GVolume is the moral
 * equivalent of #GnomeVFSDrive.
 * 
 * Mounting a #GVolume instance is an asynchronous operation. For more
 * information about asynchronous operations, see #GAsyncResult and
 * #GTask. To mount a #GVolume, first call g_volume_mount() with (at
 * least) the #GVolume instance, optionally a #GMountOperation object
 * and a #GAsyncReadyCallback.
 * 
 * Typically, one will only want to pass %NULL for the
 * #GMountOperation if automounting all volumes when a desktop session
 * starts since it's not desirable to put up a lot of dialogs asking
 * for credentials.
 * 
 * The callback will be fired when the operation has resolved (either
 * with success or failure), and a #GAsyncReady structure will be
 * passed to the callback.  That callback should then call
 * g_volume_mount_finish() with the #GVolume instance and the
 * #GAsyncReady data to see if the operation was completed
 * successfully.  If an @error is present when g_volume_mount_finish()
 * is called, then it will be filled with any error information.
 * 
 * ## Volume Identifiers # {#volume-identifier}
 * 
 * It is sometimes necessary to directly access the underlying
 * operating system object behind a volume (e.g. for passing a volume
 * to an application via the commandline). For this purpose, GIO
 * allows to obtain an 'identifier' for the volume. There can be
 * different kinds of identifiers, such as Hal UDIs, filesystem labels,
 * traditional Unix devices (e.g. `/dev/sda2`), UUIDs. GIO uses predefined
 * strings as names for the different kinds of identifiers:
 * #G_VOLUME_IDENTIFIER_KIND_HAL_UDI, #G_VOLUME_IDENTIFIER_KIND_LABEL, etc.
 * Use g_volume_get_identifier() to obtain an identifier for a volume.
 * 
 * 
 * Note that #G_VOLUME_IDENTIFIER_KIND_HAL_UDI will only be available
 * when the gvfs hal volume monitor is in use. Other volume monitors
 * will generally be able to provide the #G_VOLUME_IDENTIFIER_KIND_UNIX_DEVICE
 * identifier, which can be used to obtain a hal device by means of
 * libhal_manager_find_device_string_match().
 */
public template VolumeT(TStruct)
{
	/** Get the main GObject struct */
	public GVolume* getVolumeStruct()
	{
		return cast(GVolume*)getStruct();
	}


	/**
	 * Checks if a volume can be ejected.
	 *
	 * Return: %TRUE if the @volume can be ejected. %FALSE otherwise
	 */
	public bool canEject()
	{
		return g_volume_can_eject(getVolumeStruct()) != 0;
	}

	/**
	 * Checks if a volume can be mounted.
	 *
	 * Return: %TRUE if the @volume can be mounted. %FALSE otherwise
	 */
	public bool canMount()
	{
		return g_volume_can_mount(getVolumeStruct()) != 0;
	}

	/**
	 * Ejects a volume. This is an asynchronous operation, and is
	 * finished by calling g_volume_eject_finish() with the @volume
	 * and #GAsyncResult returned in the @callback.
	 *
	 * Deprecated: Use g_volume_eject_with_operation() instead.
	 *
	 * Params:
	 *     flags = flags affecting the unmount if required for eject
	 *     cancellable = optional #GCancellable object, %NULL to ignore
	 *     callback = a #GAsyncReadyCallback, or %NULL
	 *     userData = user data that gets passed to @callback
	 */
	public void eject(GMountUnmountFlags flags, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		g_volume_eject(getVolumeStruct(), flags, (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes ejecting a volume. If any errors occurred during the operation,
	 * @error will be set to contain the errors and %FALSE will be returned.
	 *
	 * Deprecated: Use g_volume_eject_with_operation_finish() instead.
	 *
	 * Params:
	 *     result = a #GAsyncResult
	 *
	 * Return: %TRUE, %FALSE if operation failed
	 *
	 * Throws: GException on failure.
	 */
	public bool ejectFinish(AsyncResultIF result)
	{
		GError* err = null;
		
		auto p = g_volume_eject_finish(getVolumeStruct(), (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Ejects a volume. This is an asynchronous operation, and is
	 * finished by calling g_volume_eject_with_operation_finish() with the @volume
	 * and #GAsyncResult data returned in the @callback.
	 *
	 * Params:
	 *     flags = flags affecting the unmount if required for eject
	 *     mountOperation = a #GMountOperation or %NULL to
	 *         avoid user interaction
	 *     cancellable = optional #GCancellable object, %NULL to ignore
	 *     callback = a #GAsyncReadyCallback, or %NULL
	 *     userData = user data passed to @callback
	 *
	 * Since: 2.22
	 */
	public void ejectWithOperation(GMountUnmountFlags flags, MountOperation mountOperation, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		g_volume_eject_with_operation(getVolumeStruct(), flags, (mountOperation is null) ? null : mountOperation.getMountOperationStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes ejecting a volume. If any errors occurred during the operation,
	 * @error will be set to contain the errors and %FALSE will be returned.
	 *
	 * Params:
	 *     result = a #GAsyncResult
	 *
	 * Return: %TRUE if the volume was successfully ejected. %FALSE otherwise
	 *
	 * Since: 2.22
	 *
	 * Throws: GException on failure.
	 */
	public bool ejectWithOperationFinish(AsyncResultIF result)
	{
		GError* err = null;
		
		auto p = g_volume_eject_with_operation_finish(getVolumeStruct(), (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Gets the kinds of [identifiers][volume-identifier] that @volume has.
	 * Use g_volume_get_identifier() to obtain the identifiers themselves.
	 *
	 * Return: a %NULL-terminated array
	 *     of strings containing kinds of identifiers. Use g_strfreev() to free.
	 */
	public string[] enumerateIdentifiers()
	{
		return Str.toStringArray(g_volume_enumerate_identifiers(getVolumeStruct()));
	}

	/**
	 * Gets the activation root for a #GVolume if it is known ahead of
	 * mount time. Returns %NULL otherwise. If not %NULL and if @volume
	 * is mounted, then the result of g_mount_get_root() on the
	 * #GMount object obtained from g_volume_get_mount() will always
	 * either be equal or a prefix of what this function returns. In
	 * other words, in code
	 *
	 * |[<!-- language="C" -->
	 * GMount *mount;
	 * GFile *mount_root
	 * GFile *volume_activation_root;
	 *
	 * mount = g_volume_get_mount (volume); // mounted, so never NULL
	 * mount_root = g_mount_get_root (mount);
	 * volume_activation_root = g_volume_get_activation_root (volume); // assume not NULL
	 * ]|
	 * then the expression
	 * |[<!-- language="C" -->
	 * (g_file_has_prefix (volume_activation_root, mount_root) ||
	 * g_file_equal (volume_activation_root, mount_root))
	 * ]|
	 * will always be %TRUE.
	 *
	 * Activation roots are typically used in #GVolumeMonitor
	 * implementations to find the underlying mount to shadow, see
	 * g_mount_is_shadowed() for more details.
	 *
	 * Return: the activation root of @volume
	 *     or %NULL. Use g_object_unref() to free.
	 *
	 * Since: 2.18
	 */
	public FileIF getActivationRoot()
	{
		auto p = g_volume_get_activation_root(getVolumeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(File, FileIF)(cast(GFile*) p);
	}

	/**
	 * Gets the drive for the @volume.
	 *
	 * Return: a #GDrive or %NULL if @volume is not
	 *     associated with a drive. The returned object should be unreffed
	 *     with g_object_unref() when no longer needed.
	 */
	public DriveIF getDrive()
	{
		auto p = g_volume_get_drive(getVolumeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Drive, DriveIF)(cast(GDrive*) p);
	}

	/**
	 * Gets the icon for @volume.
	 *
	 * Return: a #GIcon.
	 *     The returned object should be unreffed with g_object_unref()
	 *     when no longer needed.
	 */
	public IconIF getIcon()
	{
		auto p = g_volume_get_icon(getVolumeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}

	/**
	 * Gets the identifier of the given kind for @volume.
	 * See the [introduction][volume-identifier] for more
	 * information about volume identifiers.
	 *
	 * Params:
	 *     kind = the kind of identifier to return
	 *
	 * Return: a newly allocated string containing the
	 *     requested identfier, or %NULL if the #GVolume
	 *     doesn't have this kind of identifier
	 */
	public string getIdentifier(string kind)
	{
		return Str.toString(g_volume_get_identifier(getVolumeStruct(), Str.toStringz(kind)));
	}

	/**
	 * Gets the mount for the @volume.
	 *
	 * Return: a #GMount or %NULL if @volume isn't mounted.
	 *     The returned object should be unreffed with g_object_unref()
	 *     when no longer needed.
	 */
	public MountIF getMount()
	{
		auto p = g_volume_get_mount(getVolumeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Mount, MountIF)(cast(GMount*) p);
	}

	/**
	 * Gets the name of @volume.
	 *
	 * Return: the name for the given @volume. The returned string should
	 *     be freed with g_free() when no longer needed.
	 */
	public string getName()
	{
		return Str.toString(g_volume_get_name(getVolumeStruct()));
	}

	/**
	 * Gets the sort key for @volume, if any.
	 *
	 * Return: Sorting key for @volume or %NULL if no such key is available
	 *
	 * Since: 2.32
	 */
	public string getSortKey()
	{
		return Str.toString(g_volume_get_sort_key(getVolumeStruct()));
	}

	/**
	 * Gets the symbolic icon for @volume.
	 *
	 * Return: a #GIcon.
	 *     The returned object should be unreffed with g_object_unref()
	 *     when no longer needed.
	 *
	 * Since: 2.34
	 */
	public IconIF getSymbolicIcon()
	{
		auto p = g_volume_get_symbolic_icon(getVolumeStruct());
		
		if(p is null)
		{
			return null;
		}
		
		return ObjectG.getDObject!(Icon, IconIF)(cast(GIcon*) p);
	}

	/**
	 * Gets the UUID for the @volume. The reference is typically based on
	 * the file system UUID for the volume in question and should be
	 * considered an opaque string. Returns %NULL if there is no UUID
	 * available.
	 *
	 * Return: the UUID for @volume or %NULL if no UUID can be computed.
	 *     The returned string should be freed with g_free()
	 *     when no longer needed.
	 */
	public string getUuid()
	{
		return Str.toString(g_volume_get_uuid(getVolumeStruct()));
	}

	/**
	 * Mounts a volume. This is an asynchronous operation, and is
	 * finished by calling g_volume_mount_finish() with the @volume
	 * and #GAsyncResult returned in the @callback.
	 *
	 * Params:
	 *     flags = flags affecting the operation
	 *     mountOperation = a #GMountOperation or %NULL to avoid user interaction
	 *     cancellable = optional #GCancellable object, %NULL to ignore
	 *     callback = a #GAsyncReadyCallback, or %NULL
	 *     userData = user data that gets passed to @callback
	 */
	public void mount(GMountMountFlags flags, MountOperation mountOperation, Cancellable cancellable, GAsyncReadyCallback callback, void* userData)
	{
		g_volume_mount(getVolumeStruct(), flags, (mountOperation is null) ? null : mountOperation.getMountOperationStruct(), (cancellable is null) ? null : cancellable.getCancellableStruct(), callback, userData);
	}

	/**
	 * Finishes mounting a volume. If any errors occurred during the operation,
	 * @error will be set to contain the errors and %FALSE will be returned.
	 *
	 * If the mount operation succeeded, g_volume_get_mount() on @volume
	 * is guaranteed to return the mount right after calling this
	 * function; there's no need to listen for the 'mount-added' signal on
	 * #GVolumeMonitor.
	 *
	 * Params:
	 *     result = a #GAsyncResult
	 *
	 * Return: %TRUE, %FALSE if operation failed
	 *
	 * Throws: GException on failure.
	 */
	public bool mountFinish(AsyncResultIF result)
	{
		GError* err = null;
		
		auto p = g_volume_mount_finish(getVolumeStruct(), (result is null) ? null : result.getAsyncResultStruct(), &err) != 0;
		
		if (err !is null)
		{
			throw new GException( new ErrorG(err) );
		}
		
		return p;
	}

	/**
	 * Returns whether the volume should be automatically mounted.
	 *
	 * Return: %TRUE if the volume should be automatically mounted
	 */
	public bool shouldAutomount()
	{
		return g_volume_should_automount(getVolumeStruct()) != 0;
	}

	int[string] connectedSignals;

	void delegate(VolumeIF)[] _onChangedListeners;
	@property void delegate(VolumeIF)[] onChangedListeners()
	{
		return _onChangedListeners;
	}
	/**
	 * Emitted when the volume has been changed.
	 */
	void addOnChanged(void delegate(VolumeIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "changed" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"changed",
				cast(GCallback)&callBackChanged,
				cast(void*)cast(VolumeIF)this,
				null,
				connectFlags);
			connectedSignals["changed"] = 1;
		}
		_onChangedListeners ~= dlg;
	}
	extern(C) static void callBackChanged(GVolume* volumeStruct, VolumeIF _volume)
	{
		foreach ( void delegate(VolumeIF) dlg; _volume.onChangedListeners )
		{
			dlg(_volume);
		}
	}

	void delegate(VolumeIF)[] _onRemovedListeners;
	@property void delegate(VolumeIF)[] onRemovedListeners()
	{
		return _onRemovedListeners;
	}
	/**
	 * This signal is emitted when the #GVolume have been removed. If
	 * the recipient is holding references to the object they should
	 * release them so the object can be finalized.
	 */
	void addOnRemoved(void delegate(VolumeIF) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "removed" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"removed",
				cast(GCallback)&callBackRemoved,
				cast(void*)cast(VolumeIF)this,
				null,
				connectFlags);
			connectedSignals["removed"] = 1;
		}
		_onRemovedListeners ~= dlg;
	}
	extern(C) static void callBackRemoved(GVolume* volumeStruct, VolumeIF _volume)
	{
		foreach ( void delegate(VolumeIF) dlg; _volume.onRemovedListeners )
		{
			dlg(_volume);
		}
	}
}
