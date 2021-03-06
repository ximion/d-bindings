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


module gio.FileMonitor;

private import gi.gio;
public  import gi.giotypes;
private import gio.File;
private import gio.FileIF;
private import gobject.ObjectG;
private import gobject.Signals;


/**
 * Monitors a file or directory for changes.
 * 
 * To obtain a #GFileMonitor for a file or directory, use
 * g_file_monitor(), g_file_monitor_file(), or
 * g_file_monitor_directory().
 * 
 * To get informed about changes to the file or directory you are
 * monitoring, connect to the #GFileMonitor::changed signal. The
 * signal will be emitted in the
 * [thread-default main context][g-main-context-push-thread-default]
 * of the thread that the monitor was created in
 * (though if the global default main context is blocked, this may
 * cause notifications to be blocked even if the thread-default
 * context is still running).
 */
public class FileMonitor : ObjectG
{
	/** the main GObject struct */
	protected GFileMonitor* gFileMonitor;

	/** Get the main GObject struct */
	public GFileMonitor* getFileMonitorStruct()
	{
		return gFileMonitor;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gFileMonitor;
	}

	protected override void setStruct(GObject* obj)
	{
		gFileMonitor = cast(GFileMonitor*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GFileMonitor* gFileMonitor, bool ownedRef = false)
	{
		this.gFileMonitor = gFileMonitor;
		super(cast(GObject*)gFileMonitor, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_file_monitor_get_type();
	}

	/**
	 * Cancels a file monitor.
	 *
	 * Return: always %TRUE
	 */
	public bool cancel()
	{
		return g_file_monitor_cancel(gFileMonitor) != 0;
	}

	/** */
	public void emitEvent(FileIF child, FileIF otherFile, GFileMonitorEvent eventType)
	{
		g_file_monitor_emit_event(gFileMonitor, (child is null) ? null : child.getFileStruct(), (otherFile is null) ? null : otherFile.getFileStruct(), eventType);
	}

	/**
	 * Returns whether the monitor is canceled.
	 *
	 * Return: %TRUE if monitor is canceled. %FALSE otherwise.
	 */
	public bool isCancelled()
	{
		return g_file_monitor_is_cancelled(gFileMonitor) != 0;
	}

	/**
	 * Sets the rate limit to which the @monitor will report
	 * consecutive change events to the same file.
	 *
	 * Params:
	 *     limitMsecs = a non-negative integer with the limit in milliseconds
	 *         to poll for changes
	 */
	public void setRateLimit(int limitMsecs)
	{
		g_file_monitor_set_rate_limit(gFileMonitor, limitMsecs);
	}

	int[string] connectedSignals;

	void delegate(FileIF, FileIF, GFileMonitorEvent, FileMonitor)[] onChangedListeners;
	/**
	 * Emitted when @file has been changed.
	 *
	 * If using %G_FILE_MONITOR_WATCH_RENAMES on a directory monitor, and
	 * the information is available (and if supported by the backend),
	 * @event_type may be %G_FILE_MONITOR_EVENT_RENAMED,
	 * %G_FILE_MONITOR_EVENT_MOVED_IN or %G_FILE_MONITOR_EVENT_MOVED_OUT.
	 *
	 * In all cases @file will be a child of the monitored directory.  For
	 * renames, @file will be the old name and @other_file is the new
	 * name.  For "moved in" events, @file is the name of the file that
	 * appeared and @other_file is the old name that it was moved from (in
	 * another directory).  For "moved out" events, @file is the name of
	 * the file that used to be in this directory and @other_file is the
	 * name of the file at its new location.
	 *
	 * It makes sense to treat %G_FILE_MONITOR_EVENT_MOVED_IN as
	 * equivalent to %G_FILE_MONITOR_EVENT_CREATED and
	 * %G_FILE_MONITOR_EVENT_MOVED_OUT as equivalent to
	 * %G_FILE_MONITOR_EVENT_DELETED, with extra information.
	 * %G_FILE_MONITOR_EVENT_RENAMED is equivalent to a delete/create
	 * pair.  This is exactly how the events will be reported in the case
	 * that the %G_FILE_MONITOR_WATCH_RENAMES flag is not in use.
	 *
	 * If using the deprecated flag %G_FILE_MONITOR_SEND_MOVED flag and @event_type is
	 * #G_FILE_MONITOR_EVENT_MOVED, @file will be set to a #GFile containing the
	 * old path, and @other_file will be set to a #GFile containing the new path.
	 *
	 * In all the other cases, @other_file will be set to #NULL.
	 *
	 * Params:
	 *     file = a #GFile.
	 *     otherFile = a #GFile or #NULL.
	 *     eventType = a #GFileMonitorEvent.
	 */
	void addOnChanged(void delegate(FileIF, FileIF, GFileMonitorEvent, FileMonitor) dlg, ConnectFlags connectFlags=cast(ConnectFlags)0)
	{
		if ( "changed" !in connectedSignals )
		{
			Signals.connectData(
				this,
				"changed",
				cast(GCallback)&callBackChanged,
				cast(void*)this,
				null,
				connectFlags);
			connectedSignals["changed"] = 1;
		}
		onChangedListeners ~= dlg;
	}
	extern(C) static void callBackChanged(GFileMonitor* filemonitorStruct, GFile* file, GFile* otherFile, GFileMonitorEvent eventType, FileMonitor _filemonitor)
	{
		foreach ( void delegate(FileIF, FileIF, GFileMonitorEvent, FileMonitor) dlg; _filemonitor.onChangedListeners )
		{
			dlg(ObjectG.getDObject!(File, FileIF)(file), ObjectG.getDObject!(File, FileIF)(otherFile), eventType, _filemonitor);
		}
	}
}
