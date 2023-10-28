#include <linux/module.h>
#include <linux/printk.h>
#include <linux/init.h>
#include <linux/fs.h>
#include <linux/device.h>

#define NOD_NAME "ssafyFile"

MODULE_LICENSE("GPL");

static int NOD_MAJOR;
static struct class *cls;

static int ssafy_open(struct inode *inode, struct file *filp){
    
	return 0;
}

static int ssafy_release(struct inode *inode, struct file *filp){
    
	return 0;
}

static ssize_t ssafy_ioctl(struct file *filp, unsigned int cmd, unsigned long arg){

    return 0;
}
static struct file_operations fops = {
    .owner = THIS_MODULE,
    .open = ssafy_open,
    .release = ssafy_release,
    .unlocked_ioctl = ssafy_ioctl,
};


static int __init ssafy_init(void){
    NOD_MAJOR = register_chrdev(0, NOD_NAME, &fops);
    if( NOD_MAJOR < 0 ){

        return NOD_MAJOR;
    }

    cls = class_create(THIS_MODULE, NOD_NAME);
    device_create(cls, NULL, MKDEV(NOD_MAJOR, 0), NULL, NOD_NAME);

	return 0;
}
static void __exit ssafy_exit(void){
    device_destroy(cls, MKDEV(NOD_MAJOR, 0));
    class_destroy(cls);

    unregister_chrdev(NOD_MAJOR, NOD_NAME);

}
module_init(ssafy_init);
module_exit(ssafy_exit);

