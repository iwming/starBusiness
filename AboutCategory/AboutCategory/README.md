## Category
###推荐使用的场景
A、可以把类的实现分开几个不同文件，减少单个文件的体积，按功能切割独立开发，也可以按需加载想要的Category等
B、声明私有方法
### category 和 extension
A、category 在运行期决议，extension在编译期决议
B、extension可以添加实例变量，category无法（因为在运行期，对象的内存布局已经确定）
```
typedef struct category_t {
const char *name;
classref_t cls;
struct method_list_t *instanceMethods;
struct method_list_t *classMethods;
struct protocol_list_t *protocols;
struct property_list_t *instanceProperties;
} category_t;
```
