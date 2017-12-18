
# 17  16  15  14  13
# 18   5   4   3  12
# 19   6   1   2  11
# 20   7   8   9  10
# 21  22  23  24  25 


# 1  2   3   4  5   6  7

# variation on the previous solution, but this time we need to save all
# the value we already been through, and select those that we neighbor with
# so on every step we copy the last item in history
# update the coordinates and sum up all the neighboring values

# then we wait till we pass the target value 

# the loop does not terminate correctly again, so take the fist solution that
# is marked as >>> val reached
$script:squareSize = 1
$val = 325489

#$val = 23

$script:coord = @( @{ x = 0; y = 0; num = 1 } )
$script:numFound = $null

function sumNeighbors() { 
    #sum up neighbors
    $neighbors =@( $script:coord | 
        where { ([math]::abs($new.x - $_.x)  -le 1) -and  ([math]::abs($new.y - $_.y) -le 1) } )
    $s = $neighbors | foreach {$sum=0} { $sum += $_.num} {$sum}
    $s
}

function copyPrev () {
    $previous = $script:coord[-1]
    @{ x = $previous.x; y = $previous.y; num = -1 }
}
function right() {
    
    $new = copyPrev
    $new.x++ 
    

    $new.num = sumNeighbors
    
    $script:coord += $new
}

function left() {
    $new = copyPrev
    $new.x--
   
    $new.num = sumNeighbors
    
    $script:coord += $new
}

function up() {
    $new =copyPrev
    $new.y++
  
    $new.num = sumNeighbors
    
    $script:coord += $new
}

function down() {
    $new = copyPrev
    $new.y--

    $new.num = sumNeighbors
    
    $script:coord += $new
}

function w () {
    write-host "($($script:coord[-1].x),$($script:coord[-1].y)) - $($script:coord[-1].num)"
}
function checkNum() {
    
    w
    if ($script:coord.num -gt $val) {
        write-host ">>> val reached"
        w   
        $script:numFound = $script:coord[-1]
        write-host "num" ( $script:numFound.num )
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



