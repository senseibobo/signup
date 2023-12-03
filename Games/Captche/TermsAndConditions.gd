extends Captcha


const a = """If you succesfully sign up in first try, know that we know you location!

SignUp gathers feedback through its instagram account(@SignUp), and other game-related services like postmail. These Terms of Service govern the relationship between you and SignUp regarding the use of the Services and “User(“you”, “user” or “player”)” means the person who agrees to these Terms of Service (the “Terms”). By using the Services, you accept and agree to be bound and abide by these Terms of Service and If you do not want to agree to these terms and conditions, you must not use the Service. If your age is below 18 and chooses to use the Service, we may ask consent from the holder of your parental responsibility. PLEASE NOTE THE ARBITRATION PROVISION SET FORTH IN SPECIAL'S SECTION , WHICH REQUIRES, EXCEPT WHERE AND TO THE EXTENT PROHIBITED BY LAW, YOU TO ARBITRATE ANY CLAIMS YOU MAY HAVE AGAINST THE COMPANY ON AN INDIVIDUAL BASIS. ARBITRATION ON AN INDIVIDUAL BASIS MEANS THAT YOU WILL NOT HAVE, AND YOU WAIVE, THE RIGHT FOR A JUDGE OR JURY TO DECIDE YOUR CLAIMS, AND THAT YOU MAY NOT PROCEED IN A CLASS, CONSOLIDATED, OR REPRESENTATIVE CAPACITY.

1.
You need to sign Up a SingUp  Account (an “Account”) in order to use the Service. If you link your Account with any of the third party providers such as Google, Facebook, you are obligated to comply with their terms of service along with our Terms of Service. By default, SignUp shall in principle allow Account registration under the condition that you have no record of restriction using our Service. If it is your first time registering our Account, you may be asked to indicate your age and must meet the legislative requirement where you reside. If you are a minor child, SignUp may prohibit account creation or ask you to provide consent from your parents or legal guardian. It is not allowed to create or use an Account on behalf of a legal entity or for a commercial purpose.
2.
You are entitled to terminate your Account at any time through SignUp's website, and once your Account becomes terminated, your Account information and Account history will be immediately removed. SignUp may terminate your Account in its sole discretion without any prior notice including but not limited to (a) your Account becomes inactive or not being used for one year; (b) you violate the terms provided in this agreement; (c) we suspect unlawful activity from your Account. We have no obligation to reimburse any of the Virtual currency or virtual goods lost due to such termination and you also acknowledge that SignUp is not liable to provide a refund for any reason. Your unused Virtual Currency and Virtual Goods in your Account will be removed without any compensation regardless that the termination was voluntary or involuntary. In the event that SignUp cease to provide the Service, SignUp shall provide you with no less than one month prior notice from the date the Account becomes terminated. You are fully responsible for any problem that may occur due to inaccurate information provided when registering an Account and You also acknowledge that SignUp reserves the right to terminate your Account if the information that you have provided is inaccurate or not up to date.
3.
You are responsible to secure your Account and login information. SignUp will not be liable for any issue that is related to your Account and login information under the condition that there are no intentional actions or gross negligence from SignUp. In the event you become aware of or reasonably suspect any breach of security, including without limitation any loss, theft, or unauthorized disclosure of the login Information, you must immediately notify SignUp.
4.
The retention and use of your personal information will be controlled and governed by SignUp's Privacy Policy."""

func _ready():
	$Control/ScrollContainer/TOS.text = ""
	$Control/ScrollContainer/TOS.text += a
	$Control/ScrollContainer/TOS.text += a
	$Control/ScrollContainer/TOS.text += a
	
func _init():
	max_time = 12.0

func _process(delta):
	var a = $Control/ScrollContainer.get_v_scrollbar()
	if a.max_value-a.page == a.value:
		$Button.visible = true


func _on_Button_pressed():
	emit_signal("done")
	queue_free()
