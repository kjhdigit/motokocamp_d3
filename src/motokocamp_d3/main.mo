
import Nat "mo:base/Nat";
import Debug "mo:base/Debug";
import Result "mo:base/Result";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";


actor {

//c 1 
    private func swap(array:[var Nat], i: Nat, j: Nat): [var Nat]{
        var tmp : Nat = array[i];
        array[i] := array[j];
        array[j] := tmp;
        return array;
    };


//c2 
    public func init_count(n : Nat) : async [Nat]{
        return Array.tabulate(n, func(i : Nat) : Nat {i});
    };
    
//c3
    public func seven(array : [Nat]) : async Result.Result<Text, Text>{
        for(v in array.vals()){
            if(v == 7) return #ok("Seven is found");
        };
        return #err("Seven not found");
    };

// c4
    public func nat_opt_to_nat(n : ?Nat, m : Nat): async Nat{
        switch(n){
            case(null) return m;
            case(?n) return n;
        };
    };


// c5
    public func day_of_the_week(n: Nat) : async ?Text{
        let day_text_array : [Text] = [
            "Monday", "Tuesday", "Wednesday", "Thirsday", "Friday", "Sataday", "Sunday"
        ];
        switch(n <= 7){
            case(true) return ?day_text_array[n-1];
            case(false) return (null);
        };
    };

//c6
    public func populate_array(array : [?Nat]) : async [Nat]{
        return Array.map(array, func(i : ?Nat) : Nat{
            switch(i){
                case(null) 0;
                case(?i) i;
            };
        });
    };

// c7
    public func sum_of_array(array : [Nat]) : async Nat{
        return Array.foldRight(array, 0, func(x: Nat, y: Nat) : Nat{
            x + y;
        })
    };

// c8
    public func squared_array(array : [Nat]) : async [Nat]{
        return Array.map(array, func(x: Nat) : Nat {
            x ** 2;
        });
    };

//c9
    public func increate_by_index(array : [Nat]) : async [Nat]{
        return Array.mapEntries(array, func(x : Nat, y: Nat) : Nat{
            x + y;
        });
    };

// c10
    private func contains<A>(array : [A], a : A, f : (A , A) -> Bool) : Bool{
        let new_array : [A] = Array.filter(array, func(i: A) : Bool{
            f(a, i);
        });
        return (new_array.size() > 0);
    };

    // test for Challenge 10
    public func contains_test(array : [Nat], a : Nat) : async Bool{
        return contains<Nat>(array, a, func(x: Nat, y: Nat) : Bool {x == y});
    };



    // let array : [Nat] = [10, 3, 4, 5];
    // let a : Nat = array[3]; // 5
    // let array : [Nat] = [1, 3 , 4];
    // let size : Nat = array.size() // 3
    // let array_1 : [Nat] = [1, 2, 3]; // immutable
    // let array_2: [var Nat] = [1, 2, 3]; // mutable

    // public func index_of_one(array : [Nat]) : async ?Nat {
    //     for((number,index) in array.vals()){
    //         if(number == 1) {
    //             return index;
    //         }
    //     };
    //     return null;
    // };

    // public func null_or_nat(n : ?Nat) : async Text {
    //     switch(n){
    //         // Case where n is null
    //         case(null) {
    //             return ("The argument is null");
    //         };
    //         // Case where n is a nat
    //         case(?something){
    //             return ("The argument is : " # Nat.toText(something));
    //         };
    //     };
    // };



    // public func is_array_size_even<T>(array : [T]) : async Bool {
    //     let size = array.size();
    //     if(size % 2 == 0){
    //         return true;
    //     } else {
    //         return false;
    //     };
    // };

    // let array : [Nat] = [1,2,3,4];
    // let bool : Boolean = is_array_size_even<Nat>(array); // I indicate to the compiler which type I'm 
    

    // let f = func (n : Nat) : Bool {
    //     if (n > 10) {
    //         return true
    //     } else {
    //         return false
    //     };
    // };

    // public func mystere(array : [Nat]) : async ?Nat {
    //     return(Array.find<Nat>(array, f));
    // };



    // public func greet(name : Text) : async Text {
    //     return "Hello, " # name # "!";
    // };
};



// dfx canister call motokocamp_d3 swap_test '(vec { 1 ; 3 ; 5 }, 1,2)'  
// dfx canister call motokocamp_d3 swap '(vec { 1 ; 3 ; 5 }, 1,2)'  