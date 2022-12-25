

variable "myVar"{
    type=string
    default="Welcome to Terraform"
}

variable "myVar1"{
    type=number
    default="200"
}

variable "myVar2"{
    type=list
    default=[2,3,3,3,3,1,0,6,3]
}
variable "myVar3"{
    type=set(number)
    default=[9,4,3,3,6,2,1,1]
}

variable "myVar4"{
    type=map(string)
    default={
       Name="Rajiv" 
       Job="DevOps"
       Location="Bangalore"
       Company="RBS"
} 
}

