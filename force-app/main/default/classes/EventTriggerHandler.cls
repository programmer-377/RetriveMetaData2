public with sharing class EventTriggerHandler
{
    public EventTriggerHandler()
    {

    }

    String json2 = '{"event":{"name":{"html":"<p>Some text</p>"},"description":{"html":"<p>Some text</p>"},"start":{"timezone":"UTC","utc":"2024-06-12T02:00:00Z"},"end":{"timezone":"UTC","utc":"2024-06-12T02:00:00Z"},"currency":"USD","online_event":false,"organizer_id":"","listed":false,"shareable":false,"invite_only":false,"show_remaining":true,"password":"12345","capacity":100,"is_reserved_seating":false,"is_series":true,"show_pick_a_seat":true,"show_seatmap_thumbnail":true,"show_colors_in_seatmap_thumbnail":true,"locale":"de_AT"}}';

    public void createEventInEventBrite(Event__c event)
    {
        if(event != null && event.Id != null)
        {
            String endPointURL = 'https://www.eventbriteapi.com/v3/organizations/' + System.label.EventbriteOrganizerID + '/events/';
            String privateToken = 'Bearer ' + System.Label.EventbriteAPIPrivateToken;

            String eventJson =  prePareCreateEventJSON(event.Id);

            System.debug('endPointURL ' + endPointURL);
            System.debug('privateToken ' + privateToken);
            System.debug('eventJson ' + eventJson);

            Http http = new Http();
            HttpRequest request = new HttpRequest();
            HttpResponse response = new HttpResponse();
            request.setMethod('POST');
            request.setEndpoint(endPointURL);
            request.setHeader('Authorization', privateToken);
            request.setHeader('Content-Type', 'application/json');
            request.setHeader('Accept', 'application/json');
            request.setBody(eventJson);
            response = http.send(request);

            System.debug('response ' + response.getBody());
        }
    }

    public String prePareCreateEventJSON(String eventId)
    {
        if(eventId != null && eventId != '')
        {
            List<Event__c> lstOfEvents = [SELECT Id, OwnerId, IsDeleted, Name, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastViewedDate, LastReferencedDate, Event_Name__c, Event_Name_Rich_Text__c, Event_Description__c, Event_Start_DateTime__c, Event_End_DateTime__c, Currency_Picklist__c, Online_Event__c, Eventbrite_Organizer_ID__c, Listed__c, Shareable__c, Invite_Only__c, Show_Remaining__c, Eventbrite_Event_Password__c, Event_Capacity__c, Is_Reserved_Seating__c, Is_Series__c, Show_Pick_Seat__c, Show_Seatmap_Thumbnail__c, Show_Colors_in_Seatmap_Thumbnail__c, Locale__c, Sync_Data_With_Eventbrite__c FROM Event__c WHERE Id =: eventId];

            if(lstOfEvents != null && lstOfEvents.size() > 0)
            {
                Event__c eventRec = lstOfEvents[0];
                if(eventRec != null && eventRec.Id != null)
                {
                    String eventStartDatetimeISOFormate = '';
                    String eventEndDatetimeISOFormate = '';
                    if(eventRec.Event_Start_DateTime__c != null)
                    {
                        eventStartDatetimeISOFormate = eventRec.Event_Start_DateTime__c.formatGMT('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'');
                    }
                    if(eventRec.Event_End_DateTime__c != null)
                    {
                        eventEndDatetimeISOFormate = eventRec.Event_End_DateTime__c.formatGMT('yyyy-MM-dd\'T\'HH:mm:ss\'Z\'');
                    }

                    JSONGenerator gen = JSON.createGenerator(true);
                    gen.writeStartObject();

                    // Create Event Object
                    gen.writeFieldName('event');
                    gen.writeStartObject();
                    gen.writeFieldName('name');
                    gen.writeStartObject();
                    gen.writeStringField('html', eventRec.Event_Name_Rich_Text__c);
                    gen.writeEndObject();

                    gen.writeFieldName('description');
                    gen.writeStartObject();
                    gen.writeStringField('html', eventRec.Event_Description__c);
                    gen.writeEndObject();

                    gen.writeFieldName('start');
                    gen.writeStartObject();
                    gen.writeStringField('timezone', 'UTC');
                    gen.writeStringField('utc', eventStartDatetimeISOFormate);
                    gen.writeEndObject();

                    gen.writeFieldName('end');
                    gen.writeStartObject();
                    gen.writeStringField('timezone', 'UTC');
                    gen.writeStringField('utc', eventEndDatetimeISOFormate);
                    gen.writeEndObject();

                    gen.writeStringField('currency', eventRec.Currency_Picklist__c);
                    gen.writeBooleanField('online_event', eventRec.Online_Event__c);
                    if(eventRec.Eventbrite_Organizer_ID__c != null)
                    {
                        gen.writeStringField('organizer_id', eventRec.Eventbrite_Organizer_ID__c);
                    }
                    gen.writeBooleanField('listed', eventRec.Listed__c);
                    gen.writeBooleanField('shareable', eventRec.Shareable__c);
                    gen.writeBooleanField('invite_only', eventRec.Invite_Only__c);
                    gen.writeBooleanField('show_remaining', eventRec.Show_Remaining__c);
                    gen.writeStringField('password', eventRec.Eventbrite_Event_Password__c);
                    gen.writeNumberField('capacity', eventRec.Event_Capacity__c);
                    gen.writeBooleanField('is_reserved_seating', eventRec.Is_Reserved_Seating__c);
                    gen.writeBooleanField('is_series', eventRec.Is_Series__c);
                    gen.writeBooleanField('show_pick_a_seat', eventRec.Show_Pick_Seat__c);
                    gen.writeBooleanField('show_seatmap_thumbnail', eventRec.Show_Seatmap_Thumbnail__c);
                    gen.writeBooleanField('show_colors_in_seatmap_thumbnail', eventRec.Show_Colors_in_Seatmap_Thumbnail__c);
                    gen.writeStringField('locale', eventRec.Locale__c);

                    gen.writeEndObject();
                    gen.writeEndObject();
                    String pretty = gen.getAsString();

                    return pretty;
                }
            }
        }
        return null;
    }
}