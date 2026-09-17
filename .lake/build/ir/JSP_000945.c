// Lean compiler output
// Module: JSP_000945
// Imports: public import Init public meta import Init
#include <lean/lean.h>
#if defined(__clang__)
#pragma clang diagnostic ignored "-Wunused-parameter"
#pragma clang diagnostic ignored "-Wunused-label"
#elif defined(__GNUC__) && !defined(__CLANG__)
#pragma GCC diagnostic ignored "-Wunused-parameter"
#pragma GCC diagnostic ignored "-Wunused-label"
#pragma GCC diagnostic ignored "-Wunused-but-set-variable"
#endif
#ifdef __cplusplus
extern "C" {
#endif
uint8_t lean_nat_dec_le(lean_object*, lean_object*);
lean_object* lean_nat_sub(lean_object*, lean_object*);
lean_object* l_List_range(lean_object*);
lean_object* lean_nat_add(lean_object*, lean_object*);
lean_object* lean_nat_mod(lean_object*, lean_object*);
uint8_t lean_nat_dec_eq(lean_object*, lean_object*);
LEAN_EXPORT uint8_t lp_jsp__000945__formalization_List_all___at___00JSP000945_isPrime_spec__0(lean_object*, lean_object*);
LEAN_EXPORT lean_object* lp_jsp__000945__formalization_List_all___at___00JSP000945_isPrime_spec__0___boxed(lean_object*, lean_object*);
LEAN_EXPORT uint8_t lp_jsp__000945__formalization_JSP000945_isPrime(lean_object*);
LEAN_EXPORT lean_object* lp_jsp__000945__formalization_JSP000945_isPrime___boxed(lean_object*);
LEAN_EXPORT uint8_t lp_jsp__000945__formalization_List_all___at___00JSP000945_isPrime_spec__0(lean_object* v_p_1_, lean_object* v_x_2_){
_start:
{
if (lean_obj_tag(v_x_2_) == 0)
{
uint8_t v___x_3_; 
v___x_3_ = 1;
return v___x_3_;
}
else
{
lean_object* v_head_4_; lean_object* v_tail_5_; lean_object* v___x_6_; lean_object* v___x_7_; lean_object* v___x_8_; lean_object* v___x_9_; uint8_t v___x_10_; 
v_head_4_ = lean_ctor_get(v_x_2_, 0);
v_tail_5_ = lean_ctor_get(v_x_2_, 1);
v___x_6_ = lean_unsigned_to_nat(2u);
v___x_7_ = lean_nat_add(v_head_4_, v___x_6_);
v___x_8_ = lean_nat_mod(v_p_1_, v___x_7_);
lean_dec(v___x_7_);
v___x_9_ = lean_unsigned_to_nat(0u);
v___x_10_ = lean_nat_dec_eq(v___x_8_, v___x_9_);
lean_dec(v___x_8_);
if (v___x_10_ == 0)
{
uint8_t v___x_11_; 
v___x_11_ = lean_nat_dec_le(v___x_6_, v_p_1_);
if (v___x_11_ == 0)
{
return v___x_11_;
}
else
{
v_x_2_ = v_tail_5_;
goto _start;
}
}
else
{
uint8_t v___x_13_; 
v___x_13_ = 0;
return v___x_13_;
}
}
}
}
LEAN_EXPORT lean_object* lp_jsp__000945__formalization_List_all___at___00JSP000945_isPrime_spec__0___boxed(lean_object* v_p_14_, lean_object* v_x_15_){
_start:
{
uint8_t v_res_16_; lean_object* v_r_17_; 
v_res_16_ = lp_jsp__000945__formalization_List_all___at___00JSP000945_isPrime_spec__0(v_p_14_, v_x_15_);
lean_dec(v_x_15_);
lean_dec(v_p_14_);
v_r_17_ = lean_box(v_res_16_);
return v_r_17_;
}
}
LEAN_EXPORT uint8_t lp_jsp__000945__formalization_JSP000945_isPrime(lean_object* v_p_18_){
_start:
{
lean_object* v___x_19_; uint8_t v___x_20_; 
v___x_19_ = lean_unsigned_to_nat(2u);
v___x_20_ = lean_nat_dec_le(v___x_19_, v_p_18_);
if (v___x_20_ == 0)
{
return v___x_20_;
}
else
{
lean_object* v___x_21_; lean_object* v___x_22_; uint8_t v___x_23_; 
v___x_21_ = lean_nat_sub(v_p_18_, v___x_19_);
v___x_22_ = l_List_range(v___x_21_);
v___x_23_ = lp_jsp__000945__formalization_List_all___at___00JSP000945_isPrime_spec__0(v_p_18_, v___x_22_);
lean_dec(v___x_22_);
return v___x_23_;
}
}
}
LEAN_EXPORT lean_object* lp_jsp__000945__formalization_JSP000945_isPrime___boxed(lean_object* v_p_24_){
_start:
{
uint8_t v_res_25_; lean_object* v_r_26_; 
v_res_25_ = lp_jsp__000945__formalization_JSP000945_isPrime(v_p_24_);
lean_dec(v_p_24_);
v_r_26_ = lean_box(v_res_25_);
return v_r_26_;
}
}
lean_object* initialize_Init(uint8_t builtin);
lean_object* initialize_Init(uint8_t builtin);
void lean_initialize_runtime_module();
static bool _G_initialized = false;
LEAN_EXPORT lean_object* initialize_jsp__000945__formalization_JSP__000945(uint8_t builtin) {
lean_object * res;
if (_G_initialized) return lean_io_result_mk_ok(lean_box(0));
_G_initialized = true;
lean_initialize_runtime_module();
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
res = initialize_Init(builtin);
if (lean_io_result_is_error(res)) return res;
lean_dec_ref(res);
return lean_io_result_mk_ok(lean_box(0));
}
#ifdef __cplusplus
}
#endif
