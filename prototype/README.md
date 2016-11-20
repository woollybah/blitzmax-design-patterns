# Prototype

## Intent
Specify the kinds of objects to create using a prototypical
instance, and create new objects by copying this prototype.

![alt text](./doc/prototype.png "Prototype")

## Applicability
Use the Prototype pattern when a system should be independent of how its products are created, composed and represented; and

* when the classes to instantiate are specified at run-time, for example, by dynamic loading; or
* to avoid building a class hierarchy of factories that parallels the class hierarchy of products; or
* when instances of a class can have one of only a few different combinations of state. It may be more convenient to install a corresponding number of prototypes and clone them rather than instantiating the class manually, each time with the appropriate state

## Credits

* [Design Patterns: Elements of Reusable Object-Oriented Software](http://www.amazon.co.uk/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612)
