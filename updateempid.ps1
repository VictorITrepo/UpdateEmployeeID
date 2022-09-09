# Set EmployeeID property on ADuser
# 09/07/2022  Initial release
#
#
Function button ($title,$userID, $empID) {

    ###################Load Assembly for creating form & button######
    
    [void][System.Reflection.Assembly]::LoadWithPartialName( “System.Windows.Forms”)
    [void][System.Reflection.Assembly]::LoadWithPartialName( “Microsoft.VisualBasic”)
    
    #####Define the form size & placement
    
    $form = New-Object System.Windows.Forms.Form
    $form.Width = 500
    $form.Height = 150
    $form.Text = $title
    $form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
    
    ##############Define text label1
    $textLabel1 = New-Object System.Windows.Forms.Label
    $textLabel1.Left = 25
    $textLabel1.Top = 15
    
    $textLabel1.Text = $userid
    
    ##############Define text label2
    
    $textLabel2 = New-Object System.Windows.Forms.Label
    $textLabel2.Left = 25
    $textLabel2.Top = 50
    
    $textLabel2.Text = $empID
    
    
    ############Define text box1 for input
    $textBox1 = New-Object System.Windows.Forms.TextBox
    $textBox1.Left = 150
    $textBox1.Top = 10
    $textBox1.width = 200
    
    ############Define text box2 for input
    
    $textBox2 = New-Object System.Windows.Forms.TextBox
    $textBox2.Left = 150
    $textBox2.Top = 50
    $textBox2.width = 200
    
    
    #############Define default values for the input boxes
    $defaultValue = “”
    $textBox1.Text = $defaultValue
    $textBox2.Text = $defaultValue
    
    #############define OK button
    $button = New-Object System.Windows.Forms.Button
    $button.Left = 360
    $button.Top = 85
    $button.Width = 100
    $button.Text = “Ok”
    
    ############# This is when you have to close the form after getting values
    $eventHandler = [System.EventHandler]{
    $textBox1.Text
    $textBox2.Text
    $form.Close()}
    
    $button.Add_Click($eventHandler) 
    
    #############Add controls to all the above objects defined
    $form.Controls.Add($button)
    $form.Controls.Add($textLabel1)
    $form.Controls.Add($textLabel2)
    $form.Controls.Add($textBox1)
    $form.Controls.Add($textBox2)
    $ret = $form.ShowDialog()
    
    #################return values
    
    return $textBox1.Text, $textBox2.Text
    }
    
    $return= button “Update employeeID” “ADuser"  “EmployeeID” 
	   
#    Below variables will get the values that had been entered by the user#

    set-aduser $return[0] -Employeeid $return[1]
	
