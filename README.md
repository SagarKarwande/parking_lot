# Parking Lot

This is a automated ticketing system for parking based on some set of commands.

## Usage

---

- Make `./parking_lot.rb` executable using following command

```
chmod +x parking_lot.rb
```

- System runs in following `2` modes

### **Command input from file**

You can give commands from file where commands are entered line by line.

**Usage**

```
./parking_lot.rb input.txt
```

### **Interactive mode**

In interactive mode you can enter one command at a time and get immediate output

**Usage**

```
./parking_lot.rb
```

## System commands

---

#### `create_parking_lot`

Use this command to create a parking lot with specific number of parking slots.

**Usage** `create_parking_lot 6`

#### `park`

Using this command you can ask system to find empty parking slot for vehicle to park

**Usage** `park ​ KA-01-HH-1234​ ​ White`

#### `leave`

To empty the parking slot use this command by passing the parking slot number as argument

**Usage** `leave 4`

#### `registration_numbers_for_cars_with_colour`

Get car registraion number by vehicle color.

**Usage** `registration_numbers_for_cars_with_colour White`

#### `slot_numbers_for_cars_with_colour`

Get parking slots by vehicle color.

**Usage** `slot_numbers_for_cars_with_colour White`

#### `slot_number_for_registration_number`

Get parking slot by vehicle registration system

**Usage** `slot_number_for_registration_number KA-01-HH-3141`
