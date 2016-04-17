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


module gio.Notification;

private import gi.gio;
public  import gi.giotypes;
private import gio.IconIF;
private import glib.ConstructionException;
private import glib.Str;
private import glib.Variant;
private import gobject.ObjectG;


/**
 * #GNotification is a mechanism for creating a notification to be shown
 * to the user -- typically as a pop-up notification presented by the
 * desktop environment shell.
 * 
 * The key difference between #GNotification and other similar APIs is
 * that, if supported by the desktop environment, notifications sent
 * with #GNotification will persist after the application has exited,
 * and even across system reboots.
 * 
 * Since the user may click on a notification while the application is
 * not running, applications using #GNotification should be able to be
 * started as a D-Bus service, using #GApplication.
 * 
 * User interaction with a notification (either the default action, or
 * buttons) must be associated with actions on the application (ie:
 * "app." actions).  It is not possible to route user interaction
 * through the notification itself, because the object will not exist if
 * the application is autostarted as a result of a notification being
 * clicked.
 * 
 * A notification can be sent with g_application_send_notification().
 *
 * Since: 2.40
 */
public class Notification : ObjectG
{
	/** the main GObject struct */
	protected GNotification* gNotification;

	/** Get the main GObject struct */
	public GNotification* getNotificationStruct()
	{
		return gNotification;
	}

	/** the main GObject struct as a void* */
	protected override void* getStruct()
	{
		return cast(void*)gNotification;
	}

	protected override void setStruct(GObject* obj)
	{
		gNotification = cast(GNotification*)obj;
		super.setStruct(obj);
	}

	/**
	 * Sets our main struct and passes it to the parent class.
	 */
	public this (GNotification* gNotification, bool ownedRef = false)
	{
		this.gNotification = gNotification;
		super(cast(GObject*)gNotification, ownedRef);
	}


	/** */
	public static GType getType()
	{
		return g_notification_get_type();
	}

	/**
	 * Creates a new #GNotification with @title as its title.
	 *
	 * After populating @notification with more details, it can be sent to
	 * the desktop shell with g_application_send_notification(). Changing
	 * any properties after this call will not have any effect until
	 * resending @notification.
	 *
	 * Params:
	 *     title = the title of the notification
	 *
	 * Return: a new #GNotification instance
	 *
	 * Since: 2.40
	 *
	 * Throws: ConstructionException Failure to create GObject.
	 */
	public this(string title)
	{
		auto p = g_notification_new(Str.toStringz(title));
		
		if(p is null)
		{
			throw new ConstructionException("null returned by new");
		}
		
		this(cast(GNotification*) p, true);
	}

	/**
	 * Adds a button to @notification that activates the action in
	 * @detailed_action when clicked. That action must be an
	 * application-wide action (starting with "app."). If @detailed_action
	 * contains a target, the action will be activated with that target as
	 * its parameter.
	 *
	 * See g_action_parse_detailed_name() for a description of the format
	 * for @detailed_action.
	 *
	 * Params:
	 *     label = label of the button
	 *     detailedAction = a detailed action name
	 *
	 * Since: 2.40
	 */
	public void addButton(string label, string detailedAction)
	{
		g_notification_add_button(gNotification, Str.toStringz(label), Str.toStringz(detailedAction));
	}

	/**
	 * Adds a button to @notification that activates @action when clicked.
	 * @action must be an application-wide action (it must start with "app.").
	 *
	 * If @target is non-%NULL, @action will be activated with @target as
	 * its parameter.
	 *
	 * Params:
	 *     label = label of the button
	 *     action = an action name
	 *     target = a #GVariant to use as @action's parameter, or %NULL
	 *
	 * Since: 2.40
	 */
	public void addButtonWithTargetValue(string label, string action, Variant target)
	{
		g_notification_add_button_with_target_value(gNotification, Str.toStringz(label), Str.toStringz(action), (target is null) ? null : target.getVariantStruct());
	}

	/**
	 * Sets the body of @notification to @body.
	 *
	 * Params:
	 *     bod = the new body for @notification, or %NULL
	 *
	 * Since: 2.40
	 */
	public void setBody(string bod)
	{
		g_notification_set_body(gNotification, Str.toStringz(bod));
	}

	/**
	 * Sets the default action of @notification to @detailed_action. This
	 * action is activated when the notification is clicked on.
	 *
	 * The action in @detailed_action must be an application-wide action (it
	 * must start with "app."). If @detailed_action contains a target, the
	 * given action will be activated with that target as its parameter.
	 * See g_action_parse_detailed_name() for a description of the format
	 * for @detailed_action.
	 *
	 * When no default action is set, the application that the notification
	 * was sent on is activated.
	 *
	 * Params:
	 *     detailedAction = a detailed action name
	 *
	 * Since: 2.40
	 */
	public void setDefaultAction(string detailedAction)
	{
		g_notification_set_default_action(gNotification, Str.toStringz(detailedAction));
	}

	/**
	 * Sets the default action of @notification to @action. This action is
	 * activated when the notification is clicked on. It must be an
	 * application-wide action (start with "app.").
	 *
	 * If @target is non-%NULL, @action will be activated with @target as
	 * its parameter.
	 *
	 * When no default action is set, the application that the notification
	 * was sent on is activated.
	 *
	 * Params:
	 *     action = an action name
	 *     target = a #GVariant to use as @action's parameter, or %NULL
	 *
	 * Since: 2.40
	 */
	public void setDefaultActionAndTargetValue(string action, Variant target)
	{
		g_notification_set_default_action_and_target_value(gNotification, Str.toStringz(action), (target is null) ? null : target.getVariantStruct());
	}

	/**
	 * Sets the icon of @notification to @icon.
	 *
	 * Params:
	 *     icon = the icon to be shown in @notification, as a #GIcon
	 *
	 * Since: 2.40
	 */
	public void setIcon(IconIF icon)
	{
		g_notification_set_icon(gNotification, (icon is null) ? null : icon.getIconStruct());
	}

	/**
	 * Sets the priority of @notification to @priority. See
	 * #GNotificationPriority for possible values.
	 *
	 * Params:
	 *     priority = a #GNotificationPriority
	 */
	public void setPriority(GNotificationPriority priority)
	{
		g_notification_set_priority(gNotification, priority);
	}

	/**
	 * Sets the title of @notification to @title.
	 *
	 * Params:
	 *     title = the new title for @notification
	 *
	 * Since: 2.40
	 */
	public void setTitle(string title)
	{
		g_notification_set_title(gNotification, Str.toStringz(title));
	}

	/**
	 * Deprecated in favor of g_notification_set_priority().
	 *
	 * Params:
	 *     urgent = %TRUE if @notification is urgent
	 *
	 * Since: 2.40
	 */
	public void setUrgent(bool urgent)
	{
		g_notification_set_urgent(gNotification, urgent);
	}
}
