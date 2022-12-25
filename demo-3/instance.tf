/*-------------------------------------------------------------------------------*/
/* This script is to demonstrate command line argument and multiple tfvar files */
/* command = terraform apply -var-file="<filename.tfvars>
/*-------------------------------------------------------------------------------*/

// ************************************************************************
resource "aws_key_pair" "ssshkey" {
    key_name = "ssshkey"
    public_key = "${file ("${var.PATH_TO_PUBLIC_KEY}")}"

}   // end of resource aws_key_pair

// *************************************************************************
resource "aws_instance" "demo" {
    ami = "${lookup (var.AMIS, var.AWS_REGION)}"
    instance_type = "${var.INSTANCE_TYPE}"
    key_name = "${aws_key_pair.ssshkey.key_name}"
    tags = {
        Name = "${var.NAME}"
    }

provisioner "file" {   // copying file from local to remote server
   source = "deployscript.sh"
   destination = "/home/ubuntu/deploy.sh"                           //check if both the file names are same or not.
}

provisioner "remote-exec" {                                          // executing script to do some deployment in the server.
      inline = [
         "chmod +x /home/ubuntu/deploy.sh",
         "sudo /home/ubuntu/deploy.sh"
      ]
}

connection {
    type = "ssh"                                                      // To connect to the instance
    user = "${var.INSTANCE_USERNAME}"
    host = self.public_ip      // My personal laptop's ip address
    private_key = "${file ("${var.PATH_TO_PRIVATE_KEY}")}"
    timeout = "4m"
}


}  // end of resource aws_instance
//***************************************************************************


output "instance_ip_addr" {      // instance_ip_addr is the output 
  value = aws_instance.demo.private_ip
}

output "instance_ip_addr2" {
  value = aws_instance.demo.public_ip
}