namespace DoAnATBM
{
    partial class FormCreateRole
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textPass1 = new System.Windows.Forms.TextBox();
            this.textPass2 = new System.Windows.Forms.TextBox();
            this.buttonCreate = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(58, 26);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(79, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "Role Name:";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(58, 66);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(70, 16);
            this.label2.TabIndex = 1;
            this.label2.Text = "Password:";
            // 
            // textPass1
            // 
            this.textPass1.Location = new System.Drawing.Point(165, 60);
            this.textPass1.Name = "textPass1";
            this.textPass1.Size = new System.Drawing.Size(154, 22);
            this.textPass1.TabIndex = 1;
            this.textPass1.TextChanged += new System.EventHandler(this.textPass_TextChanged);
            // 
            // textPass2
            // 
            this.textPass2.Location = new System.Drawing.Point(165, 20);
            this.textPass2.Name = "textPass2";
            this.textPass2.Size = new System.Drawing.Size(154, 22);
            this.textPass2.TabIndex = 5;
            this.textPass2.TextChanged += new System.EventHandler(this.textPass2_TextChanged);
            // 
            // buttonCreate
            // 
            this.buttonCreate.Location = new System.Drawing.Point(139, 112);
            this.buttonCreate.Name = "buttonCreate";
            this.buttonCreate.Size = new System.Drawing.Size(100, 23);
            this.buttonCreate.TabIndex = 0;
            this.buttonCreate.Text = "Tạo Role";
            this.buttonCreate.Click += new System.EventHandler(this.buttonCreate_Click);
            // 
            // FormCreateRole
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(385, 147);
            this.Controls.Add(this.buttonCreate);
            this.Controls.Add(this.textPass1);
            this.Controls.Add(this.textPass2);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "FormCreateRole";
            this.Text = "FormCreateRole";
            this.Load += new System.EventHandler(this.FormCreateRole_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textPass1;
        private System.Windows.Forms.TextBox textPass2;
        private System.Windows.Forms.Button buttonCreate;
    }
}