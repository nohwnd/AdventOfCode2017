
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23  24  25 


# 1  2   3   4  5   6  7

# to calculate the distance we nedd cartesian coordinates
# 1 is positoned on 0,0 and we draw the spiral 
# from there by repeating steps in the loop
# every step we check if are there yet

# on every new square we go one step to the right
# and make the sqaure size bigger

# once we pass the value we calculate the distance from 
# 0,0 (where 1 is)

# notice that the way up is shorter by 2 points 
# because we don't start at the bottom corner
# of the whole square but one point more up

# the loop does not terminate correctly and 
# we use magic variable, but who cares :D
# so take the fist solution that
# is marked as >>> val reached
$script:squareSize = 1
$val = 325489

$script:coord = @{ x = 0; y = 0; num = 1 }
$script:numFound = $null

function right() {
    $script:coord.x++
    $script:coord.num++
}

function left() {
    $script:coord.x--
    $script:coord.num++
}

function up() {
    $script:coord.y++
    $script:coord.num++
}

function down() {
    $script:coord.y--
    $script:coord.num++
}

function w () {
    write-host "($($script:coord.x),$($script:coord.y)) - $($script:coord.num)"
}
function checkNum() {
    
    # w
    if ($script:coord.num -eq $val) {
        write-host ">>> val reached"
        w   
        $script:numFound = $script:coord
        write-host "distance" ( [math]::Abs(0 - $coord.x) + [math]::Abs(0 - $coord.y) )
        break
    }

   
}

function startSq() {
    right
    $script:squareSize += 2
    $script:upSize = $script:squareSize - 2
    $script:size = $script:squareSize - 1
}

while (-not $script:numFound) {
startSq
checkNum

for ($upw = 0; $upw -lt $script:upSize; $upw++){
    up
    checkNum
} 

for ($lw = 0; $lw -lt $script:size; $lw++){
    left
    checkNum
} 

for ($dw = 0; $dw -lt $script:size; $dw++){
    down
    checkNum
} 

for ($rw = 0; $rw -lt $script:size; $rw++){
    right
    checkNum
} 

}



