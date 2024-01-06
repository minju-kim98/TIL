let hello: string = "Hello world"

console.log(hello)

// 타입 종류
/// 문자
let str: string
let red: string = "Red"
let green: string = 'Green'
let myColor: string = `My color is ${red}`
let yourColor: string = 'Your color is ' + green


/// 숫자
let num: number
let integer: number = 6
let float: number = 3.14
let infinity: number = Infinity
let nan: number = NaN


/// 불린
let isBoolean: boolean
let isDone: boolean = false


/// Null / Undefined
let nul: null
let und: undefined
nul = null
console.log(nul)
console.log(und)


/// 배열
const fruits: string[] = ['Apple', 'Banana', 'Cherry']
const numbers: number[] = [1, 2, 3, 4, 5, 6, 7]
const union: (string|number)[] = ['Apple', 1, 2, 'Banana', 3]


/// 객체
//typeof DATA === 'object'
const obj: object = {}
const arr: object = []
const func: object = function () {}

const userA: {
    name: string
    age: number
    isValid: boolean
} = {
    name: 'Heropy',
    age: 85,
    isValid: true
}

interface User {
    name: string
    age: number
    isValid: boolean
}

const userB: User = {
    name: 'Neo',
    age: 22,
    isValid: false
}


/// 함수
const add: (X: number, y: number) => number = function(x, y){
    return x + y
}
const sum: number = add(1, 2)

const add2 = function (x: number, y: number): number{
    return x + y
}

const hellow: () => void = function(){
    console.log("Hello World~")
}
const h: void = hellow()

const hellow2 = function (): void{
    console.log("Hello World~")
}


/// Any - 어떤 데이터를 넣어도 상관 없다, typescript에서 되도록이면 사용하지 말것
let anyT: any = 'Hello world'
anyT = 123
anyT = false
anyT = null
anyT = {}
anyT = []
anyT = function () {}


/// Unknown - 어떤 데이터가 나올지 모르니 일단 unknown으로 처리하겠다
const a: any = 123
const u: unknown = 123

const any: any = a
const boo: boolean = a
const numb: number = a
const arry: string[] = a
const objt: {x: string, y: number} = a

const any2: any = u
// 아래는 전부 에러
// const boo2: boolean = u
// const numb2: number = u
// const arry2: string[] = u
// const objt2: {x: string, y: number} = u


/// Tuple
const tuple: [string, number, boolean] = ['a', 1, false]
const users: [number, string, boolean][]
  = [[1, 'Neo', true], [2, 'Evan', false], [3, 'Lewis', true]]


/// Void
function hello2(msg: string): void {
  console.log(`Hello ${msg}`)
}
const hi: void = hello2('world')


/// Never - 절대 발생하지 않을 값
const nev: [] = []
// 아래 코드는 에러. 안에 아무런 값도 넣을 수 없기 때문.
// nev.push(3)


/// Union
let union2: string | number
union2 = 'Hello type!'
union2 = 123
// 아래는 에러
// union2  = false


/// Intersection
interface User2 {
  name: string
  age: number
}

interface Validation{
  isValid: boolean
}

const heropy: User2 & Validation = {
  name: 'Neo',
  age: 85,
  isValid: true
}