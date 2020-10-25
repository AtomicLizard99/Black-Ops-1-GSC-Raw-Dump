

/*------------------------------------
Adds an event based on the current value of the gametypes timer

example: add_timed_event(5, "rocket launch",::launch_the_rocket); 
------------------------------------*/
add_timed_event(time, desc,func)

{

  if(!isdefined(level._timed_events))
  {
    level._timed_events = [];
  }
  
  for(i = 0; i < level._timed_events.size; i ++)
  {

    if(level._timed_events[i].time == time)
    {

    	return;               // Already got a timed event at this time, get out.
 		}
  }
  
  event = spawnstruct();
  event.time = time;
  event.index = level._timed_events.size;
  event.desc = desc;
  event.func = func;
  event.client_notify = "T" + level._timed_events.size;
  level._timed_events[level._timed_events.size] = event;  

  /#                    
  println("Added event " + desc + " at time " + time);        
  #/
  
  level thread wait_for_timed_event(event);
  
}


/*------------------------------------
waits for the notification from the server
for the timed event
------------------------------------*/
wait_for_timed_event(event)
{

  level waittill(event.client_notify);
  
  [[event.func]]();

}